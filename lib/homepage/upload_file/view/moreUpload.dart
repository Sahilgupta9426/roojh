import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:roojh/homepage/upload_file/view/testForm.dart';

import '../../../FirebaseAuth/firebase_storage/firebase_storage.dart';

// ###################################
// main page for upload file
class UploadFileList extends StatefulWidget {
  List<File>? fileNames;
  List<File>? paths;
  String? selecTest;
  DateTime? date;
  String? summery;
  UploadFileList({
    Key? key,
    String? this.selecTest,
    DateTime? this.date,
    List<File>? this.fileNames,
    List<File>? this.paths,
    String? this.summery,
  }) : super(key: key);

  @override
  State<UploadFileList> createState() => _UploadFileListState();
}

class _UploadFileListState extends State<UploadFileList> {
  // ############################
  // get current user details
  final auth = FirebaseAuth.instance.currentUser;
  // loading indicator start from 0
  double progress = 0.0;
// #################################
// get file from test form and upload in firebase storage
  Future<void> getFile() async {
    // print('file name-0000 ${widget.fileNames!.first}');

    UploadTask? task = FirebaseStorage.instance
        .ref()
        .child('${auth?.email}')
        .child('/${widget.selecTest! + widget.fileNames!.first.toString()}')
        .putData(widget.paths!.first.readAsBytesSync());
    print('--------------------$task');
    task.snapshotEvents.listen((event) {
      setState(() {
        progress =
            ((event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
                    100)
                .roundToDouble();

        print(progress);
      });
    });

    // #############################
    // when upload complete the information of file will save in firebase database
    await await task.whenComplete(() async {
      String? pdfUrl = (await task.storage
          .ref()
          .child('${auth?.email}')
          .child('/${widget.selecTest! + widget.fileNames!.first.toString()}')
          .getDownloadURL());
      print('url________________________$pdfUrl');
      FireStoreDatabase().users.add({
        'summery': widget.summery,
        'pdfUrl': pdfUrl,
        'date': widget.date,
        'documentType': widget.selecTest,
        'email': auth?.email,
        'uid': auth?.uid
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        // ##################################
        // Documents header
        Container(
          color: HexColor('#F3F6FF'),
          height: 98,
          child: Padding(
            padding: EdgeInsets.only(top: 27),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ##################################
                  // For exit button
                  TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0)),
                      onPressed: () {},
                      child: SvgPicture.asset('icons/arrow - right.svg')),
                  Container(
                      // width: 290,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Documents',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ))),
                  SizedBox(
                    width: 50,
                  )
                ]),
          ),
        ),

        SizedBox(
          height: 50,
        ),

        Container(
          child: widget.fileNames != null
              ? Padding(
                  padding: EdgeInsets.only(left: 26, right: 26),
                  child: Container(
                      height: 66,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: HexColor('#F3F6FF'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        '${widget.fileNames!.first.toString()}',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 138,
                                    // ),
                                    Text('$progress')
                                  ],
                                ),
                              ),
                              SizedBox(height: 7),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 240,
                                    child: LinearProgressIndicator(
                                      value: progress / 100,
                                      // valueColor: AlwaysStoppedAnimation(Colors.green),
                                      backgroundColor: Colors.white,
                                      color: HexColor('#204289'),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: SvgPicture.asset('icons/cross.svg'),
                          )
                        ],
                      )))
              : SizedBox(),
        ),
        SizedBox(
          height: 300,
        ),
        // ##################################
        // Upload More button
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 51,
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 25.35),
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(HexColor('#F3F6FF')),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),

                      // side: BorderSide(color: Colors.red)
                    ))),
                onPressed: () async {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => ChooseFiles()));
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TestForm()));
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 29,
                          width: 30,
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset('icons/plus_sign.svg')
                          // Icon(
                          //   Icons.facebook_rounded,
                          //   size: 29.67,
                          // ),

                          ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: const Text(
                          'Upload more',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ])),
    );
  }
}

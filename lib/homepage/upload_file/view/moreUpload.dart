import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/homepage/upload_file/view/testForm.dart';

// ###################################
// main page for upload file
class UploadFileList extends StatefulWidget {
  UploadFileList({Key? key}) : super(key: key);

  @override
  State<UploadFileList> createState() => _UploadFileListState();
}

class _UploadFileListState extends State<UploadFileList> {
  var path;

  final auth = FirebaseAuth.instance.currentUser;
  double progress = 0.0;
  // Future<void> getFile() async {

  // }
  var fileName;
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
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  // await getFile();
                  FilePickerResult? getFile = await FilePicker.platform
                      .pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['pdf']);

                  if (getFile != null) {
                    // Uint8List? file = getFile.files.first.bytes;

                    path = getFile.files.single.path;

                    fileName = getFile.files.first.name;

                    // fileName = getFile.files.first.name;
                    print('file name-0000 $fileName');
                    File file = await File(path!);
                    UploadTask? task = FirebaseStorage.instance
                        .ref()
                        .child('${auth?.email}')
                        .child('/${fileName}')
                        .putData(file.readAsBytesSync());
                    print('--------------------$task');
                    task.snapshotEvents.listen((event) {
                      setState(() {
                        progress = ((event.bytesTransferred.toDouble() /
                                    event.totalBytes.toDouble()) *
                                100)
                            .roundToDouble();

                        print(progress);
                      });
                    });
                    task.whenComplete(() => null);
                  }
                },
                child: Text("Upload"),
              ),
              // SizedBox(
              //   height: 50.0,
              // ),
            ],
          ),
        ),
        Container(
          child: fileName != null
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
                                        '$fileName',
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

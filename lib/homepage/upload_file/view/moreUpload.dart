import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:roojh/homepage/upload_file/view/testForm.dart';

// ###################################
// main page for upload file
class UploadFileList extends StatefulWidget {
  const UploadFileList({Key? key}) : super(key: key);

  @override
  State<UploadFileList> createState() => _UploadFileListState();
}

class _UploadFileListState extends State<UploadFileList> {
  double progress = 0;
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
                      onPressed: () {
                        Navigator.pushNamed(context, "/home");
                      },
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
        Padding(
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
                        padding: const EdgeInsets.only(left: 10, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Doc1',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal),
                            ),
                            SizedBox(
                              width: 138,
                            ),
                            Text('7mb/23mb')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 240,
                            child: LinearProgressIndicator(
                              // value: progress,
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
              )),
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

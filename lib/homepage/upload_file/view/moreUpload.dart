import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/homepage/upload_file/view/testForm.dart';

// ###################################
// main page for upload file
class MoreUploads extends StatefulWidget {
  const MoreUploads({Key? key}) : super(key: key);

  @override
  State<MoreUploads> createState() => _MoreUploadsState();
}

class _MoreUploadsState extends State<MoreUploads> {
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
        SizedBox(height: 500),
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

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/FirebaseAuth/Authenticattion.dart';
import 'package:roojh/common_code/topImg.dart';
import 'package:roojh/homepage/home.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    bool onPressedValue = true;
    return Scaffold(
        body: Column(
      children: [
        TopImagesField(),
        SizedBox(height: 70),
        Text(
          'Verification Link has been sent to your email',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26, right: 25.35),
          child: Container(
            height: 51.8,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () async {
                await FireAuth().checkEmailVerified(context);
              },
              child: const Text('Resend',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(HexColor('#F46524')),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.9),

                    // side: BorderSide(color: Colors.red)
                  ))),
            ),
          ),
        ),
      ],
    ));
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/common_code/topImg.dart';
import 'package:roojh/forget_password/by_email.dart';
import 'package:roojh/forget_password/by_phone.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';
  Color radio_color = HexColor('#F46524');

  // Group Value for Radio Button.
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: FadeInDown(
          delay: Duration(milliseconds: 200),
          child: Column(
            children: <Widget>[
              TopImagesField(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Authenticate Account By',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                    // Text('Selected Radio Item = ' + '$radioButtonItem',
                    //     style: TextStyle(fontSize: 21)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: radio_color,
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 1;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Phone No',
                          style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Radio(
                          visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          activeColor: radio_color,
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 2;
                            });
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Email Id',
                          style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        child: radioButtonItem == 'ONE' ? ByPhone() : ByEmail())
                    // ByEmail(),
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Having Trouble?',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Get Help',
                        style: TextStyle(
                            color: radio_color,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    ));
  }
}

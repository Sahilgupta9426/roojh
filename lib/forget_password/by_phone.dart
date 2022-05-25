// import 'dart:html';

import 'package:animate_do/animate_do.dart';
// import 'package:example/pages/verification.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:roojh/Login_page/main_login.dart';

class ByPhone extends StatefulWidget {
  const ByPhone({Key? key}) : super(key: key);

  @override
  _ByPhoneState createState() => _ByPhoneState();
}

class _ByPhoneState extends State<ByPhone> {
  final TextEditingController controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(30),
      // width: double.infinity,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                'Phone No',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color: HexColor('#F3F6FF'),
              borderRadius: BorderRadius.circular(98),
              border: Border.all(color: HexColor('#CED3E1')),
              //   boxShadow: [
              //     BoxShadow(
              //       color: Color(0xffeeeeee),
              //       blurRadius: 10,
              //       offset: Offset(0, 4),
              //     ),
              //   ],
            ),
            child: Stack(
              children: [
                Container(
                  height: 48,
                  child: InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number.phoneNumber);
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    selectorConfig: SelectorConfig(
                      // setSelectorButtonAsPrefixIcon: false,
                      showFlags: false,

                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    errorMessage: 'Invalid Phone No',
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    textStyle:
                        TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600),
                    selectorTextStyle:
                        TextStyle(color: Colors.black, fontSize: 17.5),
                    textFieldController: controller,
                    formatInput: false,
                    maxLength: 12,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: false),
                    cursorColor: Colors.black,
                    inputDecoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 13, left: -30),
                      border: InputBorder.none,
                      hintText: 'Enter Your Phone Number',
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500),
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 8,
                  bottom: 8,
                  child: Container(
                    height: 40,
                    width: 2,
                    color: Colors.black.withOpacity(0.13),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 80),
          MaterialButton(
            height: 51,
            minWidth: double.infinity,
            onPressed: () {
              setState(() {
                _isLoading = true;
              });

              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  _isLoading = false;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignIn(
                              notify: '0',
                            )));
              });
            },
            color: (HexColor('#F46524')),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(98)),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: _isLoading
                ? Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    "Continue",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
          ),
        ],
      ),
    );
  }
}

// class ByPhone extends StatefulWidget {
//   const ByPhone({Key? key}) : super(key: key);

//   @override
//   _ByPhoneState createState() => _ByPhoneState();
// }

// class _ByPhoneState extends State<ByPhone> {
//   final TextEditingController controller = TextEditingController();
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(30),
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.network(
//             'https://ouch-cdn2.icons8.com/n9XQxiCMz0_zpnfg9oldMbtSsG7X6NwZi_kLccbLOKw/rs:fit:392:392/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNDMv/MGE2N2YwYzMtMjQw/NC00MTFjLWE2MTct/ZDk5MTNiY2IzNGY0/LnN2Zw.png',
//             fit: BoxFit.cover,
//             width: 280,
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           FadeInDown(
//             child: Text(
//               'REGISTER',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   color: Colors.grey.shade900),
//             ),
//           ),
//           FadeInDown(
//             delay: Duration(milliseconds: 200),
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
//               child: Text(
//                 'Enter your phone number to continu, we will send you OTP to verifiy.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           FadeInDown(
//             delay: Duration(milliseconds: 400),
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: Colors.black.withOpacity(0.13)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xffeeeeee),
//                     blurRadius: 10,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   InternationalPhoneNumberInput(
//                     onInputChanged: (PhoneNumber number) {
//                       print(number.phoneNumber);
//                     },
//                     onInputValidated: (bool value) {
//                       print(value);
//                     },
//                     selectorConfig: SelectorConfig(
//                       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                     ),
//                     ignoreBlank: false,
//                     autoValidateMode: AutovalidateMode.disabled,
//                     selectorTextStyle: TextStyle(color: Colors.black),
//                     textFieldController: controller,
//                     formatInput: false,
//                     maxLength: 9,
//                     keyboardType: TextInputType.numberWithOptions(
//                         signed: true, decimal: true),
//                     cursorColor: Colors.black,
//                     inputDecoration: InputDecoration(
//                       contentPadding: EdgeInsets.only(bottom: 15, left: 0),
//                       border: InputBorder.none,
//                       hintText: 'Phone Number',
//                       hintStyle:
//                           TextStyle(color: Colors.grey.shade500, fontSize: 16),
//                     ),
//                     onSaved: (PhoneNumber number) {
//                       print('On Saved: $number');
//                     },
//                   ),
//                   Positioned(
//                     left: 90,
//                     top: 8,
//                     bottom: 8,
//                     child: Container(
//                       height: 40,
//                       width: 1,
//                       color: Colors.black.withOpacity(0.13),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 100,
//           ),
//           FadeInDown(
//             delay: Duration(milliseconds: 600),
//             child: MaterialButton(
//               minWidth: double.infinity,
//               onPressed: () {
//                 setState(() {
//                   _isLoading = true;
//                 });

//                 Future.delayed(Duration(seconds: 2), () {
//                   setState(() {
//                     _isLoading = false;
//                   });
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => SignIn(notify: '0')));
//                 });
//               },
//               color: Colors.black,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5)),
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//               child: _isLoading
//                   ? Container(
//                       width: 20,
//                       height: 20,
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.white,
//                         color: Colors.black,
//                         strokeWidth: 2,
//                       ),
//                     )
//                   : Text(
//                       "Request OTP",
//                       style: TextStyle(color: Colors.white),
//                     ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           FadeInDown(
//             delay: Duration(milliseconds: 800),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Already have an account?',
//                   style: TextStyle(color: Colors.grey.shade700),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).pushReplacementNamed('/login');
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

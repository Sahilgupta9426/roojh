import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/FirebaseAuth/Authenticattion.dart';

import 'package:roojh/forget_password/main_forgetpassword.dart';
import 'package:roojh/homepage/home.dart';

//login form
class LoginField extends StatefulWidget {
  const LoginField({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginField> createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  @override
  Widget build(BuildContext context) {
    Color color = HexColor('#F46524');
    final _formKey = GlobalKey<FormState>();
    var email = "";
    var password = "";
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    var notify;
    var auth;

    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 2),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 26.64),
              child: TextFormField(
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: HexColor('#F3F6FF'),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Your Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                    borderSide: BorderSide(
                      color: HexColor('#CED3E1'),
                      // width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(98.67),
                      borderSide: BorderSide(
                        color: HexColor('#CED3E1'),
                        width: 1.0,
                      )),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email id';
                  }
                },
              ),
            ),
            SizedBox(height: 14.49),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 2),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 26.64),
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: HexColor('#F3F6FF'),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Your Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                    borderSide: BorderSide(
                      color: HexColor('#CED3E1'),
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(98.67),
                      borderSide: BorderSide(
                        color: HexColor('#CED3E1'),
                        width: 1.0,
                      )),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(98.67),
                  ),
                ),
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter password';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.85, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ForgetPassButton() //in the bottom
                ],
              ),
            ),
            SizedBox(height: 20.64),
            Padding(
              padding: const EdgeInsets.only(left: 26, right: 25.35),
              child: Container(
                height: 51.8,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    notify = '';
                    if (_formKey.currentState!.validate()) {
                      email = emailController.text;
                      password = passwordController.text;
                      auth = await FireAuth().signIn(email, password, context);

                      notify = await auth;
                      print(notify);
                    }
                    if (notify ==
                        'The password is invalid or the user does not have a password.') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            content: Text('invalid password')),
                      );
                    } else if (notify ==
                        'There is no user record corresponding to this identifier. The user may have been deleted.') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            content: Text('Email does not exist')),
                      );
                    }
                  },
                  child: Text('Sign in',
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
            )
          ],
        ));
  }
}

class ForgetPassButton extends StatelessWidget {
  const ForgetPassButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        onPressed: () {
          Navigator.pushNamed(context, "/forgetPass");
        },
        child: Text(
          'Forget Password?',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
        ));
  }
}

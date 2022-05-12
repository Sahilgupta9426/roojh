import 'package:flutter/material.dart';
import 'package:roojh/common_code/topImg.dart';
import 'create_account.dart';
import 'login_form.dart';
import '../common_code/login_with_buttons.dart';
import '../common_code/or_login_with.dart';

// ignore: must_be_immutable
class SignIn extends StatefulWidget {
  String notify;
  SignIn({Key? key, required this.notify}) : super(key: key);
  // const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          child: Column(
            children: [
              const TopImagesField(), //top images which in saved in 'common_code/topImg.dart'
              const Padding(
                padding:
                    EdgeInsets.only(left: 26, right: 192, top: 20, bottom: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                child: widget.notify == '1'
                    ? const Text(
                        'Sign Up Sucessfull\nPlease Verify Your Email',
                        style: TextStyle(color: Colors.green, fontSize: 17),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),
              ),
              const LoginField(), //Login Form Field which is saved in 'Login_page/login_form.dart'
              const SizedBox(
                height: 32,
              ),
              const Create_Acoount(), //text button which redirect in 'sign up page' and this code saved in Login_page/create_account.dart
              const OrLoginWith(), //it's a divider between from and login with button. this code is saved in 'Login_page/or_login_with.dart'
              const SizedBox(height: 16),
              const FacebookLogin(), //login with facebook button saved in 'common_code/login_with_button.dart'
              const SizedBox(height: 6),
              const GoogleLogin(), //login with google button saved in 'common code/login_with_button.dart'
              const SizedBox(
                height: 32,
              )
            ],
          )),
    ));
  }
}

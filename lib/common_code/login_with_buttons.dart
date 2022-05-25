import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/FirebaseAuth/Authenticattion.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      child: Padding(
        padding: const EdgeInsets.only(left: 26, right: 25.35),
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all<Color>(HexColor('#ffeae9')),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),

                // side: BorderSide(color: Colors.red)
              ))),
          onPressed: () async {
            await FireAuth().googleLogin(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 29,
                  width: 30,
                  alignment: Alignment.centerRight,
                  child: Image.asset('icons/google.png')
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
                  'Sign In With Google',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      child: Padding(
        padding: const EdgeInsets.only(left: 26, right: 25.35),
        child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor:
                  MaterialStateProperty.all<Color>(HexColor('#ffeae9')),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),

                // side: BorderSide(color: Colors.red)
              ))),
          onPressed: () async {
            print("it's facebook button");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 29,
                  width: 30,
                  alignment: Alignment.centerRight,
                  child: Image.asset('icons/facebook.png')
                  // Icon(
                  //   Icons.facebook_rounded,
                  //   size: 29.67,
                  // ),

                  ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                  'Sign In With Facebook',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

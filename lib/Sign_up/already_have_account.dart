import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:roojh/Login_page/main_login.dart';

//redirect to sign in page
class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account?',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          TextButton(
            onPressed: () {
              // Navigator.pushNamed(context, "/login");
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SignIn(notify: '0'),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, Widget child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.decelerate);
                      return ScaleTransition(
                        scale: animation,
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                  ));
            },
            child: Text('Sign In',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: HexColor('#F46524'))),
          ),
        ],
      ),
    );
  }
}

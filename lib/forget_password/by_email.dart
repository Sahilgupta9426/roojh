import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ByEmail extends StatefulWidget {
  const ByEmail({Key? key}) : super(key: key);

  @override
  State<ByEmail> createState() => _ByEmailState();
}

class _ByEmailState extends State<ByEmail> {
  final _formKey = GlobalKey<FormState>();
  var email = "";

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                  'Email id',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                filled: true,
                fillColor: HexColor('#F3F6FF'),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Enter Your Email Id",
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
                  return 'please enter name';
                }
              },
            ),
            SizedBox(
              height: 19,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 9),
                child: Text(
                  'We are sending authentication link on above Id',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 80),
            Container(
              height: 51.8,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      email = emailController.text;

                      // final SharedPreferences sharedPreferences =
                      //     await SharedPreferences.getInstance();
                      // sharedPreferences.setString(
                      //     'email', emailController.text);
                      // Navigator.pushNamed(context, "/auth");
                    });
                    _formKey.currentState!.save();
                    // print(_loginUserData);
                    // AuthController.login(_loginUserData);
                    // Navigator.pushNamed(context, "/auth");
                  }
                },
                child: Text('Continue',
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
            )
          ],
        ));
  }
}

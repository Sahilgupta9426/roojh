import 'package:flutter/material.dart';
import 'package:roojh/common_code/topImg.dart';

class ConfirmCode extends StatefulWidget {
  final email;
  const ConfirmCode({Key? key, this.email}) : super(key: key);
  // const ConfirmCode({Key? key}) : super(key: key);

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  late String code;
  var right_code;
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const TopImagesField(),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Verify Your Email Here',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: Container(
              // padding: EdgeInsets.all(8.0),
              height: 300,
              width: MediaQuery.of(context).size.width - 30.0,
              // decoration: BoxDecoration(color: Colors.white, boxShadow: [
              //   BoxShadow(color: Colors.grey.withOpacity(0.7))
              // ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      child: right_code ==
                              'Confirmation code entered is not correct.'
                          ? const Text(
                              'Please Enter Valid OTP',
                              style: TextStyle(color: Colors.red),
                            )
                          : const Text(
                              'The otp has been sent to your Email Id')),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        maxLength: 6,
                        decoration: const InputDecoration(
                          hintText: '',
                          errorStyle:
                              TextStyle(color: Colors.red, fontSize: 15),
                        ),
                        controller: codeController,
                        onChanged: (val) {
                          setState(() {
                            code = val;
                          });
                        },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() async {});
                            }
                          },
                          child: const Text('Confirm')),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

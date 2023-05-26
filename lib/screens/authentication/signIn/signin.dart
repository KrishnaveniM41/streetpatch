import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../OTP/OTPSign_IN/OTP_in.dart';

// ignore: camel_case_types
class signinPage extends StatefulWidget {
  signinPage({super.key});

  @override
  State<signinPage> createState() => _signinPageState();
}

// ignore: camel_case_types
class _signinPageState extends State<signinPage> {
  final _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submitForm() {
    if (_formKey.currentState!.validate()) {}
  }

  String? _validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Enter a phone Number';
    }

    if (value.length != 10) {
      return 'Please enter a 10 digit number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Color.fromARGB(0, 224, 219, 219),
                    width: double.infinity,
                    child: Column(children: [
                      SizedBox(height: 50),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: Color.fromARGB(251, 235, 177, 17),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Container(
                          padding: new EdgeInsets.only(right: 260.5),
                          child: Text(
                            'Sign in',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(251, 235, 177, 17),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            SizedBox(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color:
                                      const Color.fromARGB(255, 245, 244, 245)),
                              decoration: InputDecoration(
                                hintText: 'Enter your Registered Phone Number',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    color: Color.fromARGB(94, 240, 236, 240)),
                              ),
                              validator: _validatePhoneNumber,
                              controller: _phoneController,
                            ),
                            SizedBox(height: 50),
                            Column(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _submitForm();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 100, 10, 2)),
                                  ),
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        color: const Color.fromARGB(
                                            255, 245, 244, 245)),
                                  )),
                              SizedBox(height: 50),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: Size(150, 50),
                                    textStyle: TextStyle(fontSize: 20),
                                    elevation: 20, //<-- SEE HERE
                                    side: BorderSide(
                                        color: Color.fromARGB(255, 82, 6, 6),
                                        width: 3),
                                    foregroundColor: const Color.fromARGB(
                                        255, 248, 253, 255),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return OTPsignIn();
                                    }));
                                  },
                                  child: Text(
                                    'Send OTP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )),
                            ])
                          ]),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

import '../OTP/OTPSign_UP/OTP_up.dart';
import '../signIn/signin.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final _textController = TextEditingController();
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
                        'Welcome!',
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
                            'Sign up',
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
                            TextFormField(
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color:
                                      const Color.fromARGB(255, 245, 244, 245)),
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    color: Color.fromARGB(94, 240, 236, 240)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                              controller: _textController,
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color:
                                      const Color.fromARGB(255, 245, 244, 245)),
                              decoration: InputDecoration(
                                hintText: 'Enter your Phone Number',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    color: Color.fromARGB(94, 240, 236, 240)),
                              ),
                              validator: _validatePhoneNumber,
                              controller: _phoneController,
                            ),
                            SizedBox(height: 20),
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
                              SizedBox(height: 40),
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
                                      return otpupPage();
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
                        SizedBox(height: 80),
                        Row(children: [
                          Text(
                            'Already registered?',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                              color: Color.fromARGB(250, 255, 255, 255),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return signinPage();
                                }));
                              },
                              child: (Text(
                                'Sign in',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Color.fromARGB(251, 235, 177, 17),
                                ),
                              ))),
                        ]),
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

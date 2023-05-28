import 'package:flutter/material.dart';

// ignore: camel_case_types
class signinPage extends StatefulWidget {
  const signinPage({super.key});

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
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(0, 224, 219, 219),
                    width: double.infinity,
                    child: const Column(children: [
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
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        Container(
                          padding: const EdgeInsets.only(right: 260.5),
                          child: const Text(
                            'Sign in',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(251, 235, 177, 17),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(children: [
                            const SizedBox(height: 15),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color:
                                      Color.fromARGB(255, 245, 244, 245)),
                              decoration: const InputDecoration(
                                hintText: 'Enter your Registered Phone Number',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18,
                                    color: Color.fromARGB(94, 240, 236, 240)),
                              ),
                              validator: _validatePhoneNumber,
                              controller: _phoneController,
                            ),
                            const SizedBox(height: 50),
                            Column(children: [
                              ElevatedButton(
                                  onPressed: () {
                                    _submitForm();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color.fromARGB(255, 100, 10, 2)),
                                  ),
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18,
                                        color: Color.fromARGB(
                                            255, 245, 244, 245)),
                                  )),
                              const SizedBox(height: 50),
                              OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(150, 50),
                                    textStyle: const TextStyle(fontSize: 20),
                                    elevation: 20, //<-- SEE HERE
                                    side: const BorderSide(
                                        color: Color.fromARGB(255, 82, 6, 6),
                                        width: 3),
                                    foregroundColor: const Color.fromARGB(
                                        255, 248, 253, 255),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Send OTP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )),
                            ])
                          ]),
                        ),
                        const SizedBox(height: 50),
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

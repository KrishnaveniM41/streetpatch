import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPsignIn extends StatefulWidget {
  const OTPsignIn({super.key});

  @override
  State<OTPsignIn> createState() => _OTPsignInState();
}

class _OTPsignInState extends State<OTPsignIn> {
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
                  SizedBox(height: 20),
                  Container(
                      child: Text(
                    'Verification Code',
                    style: TextStyle(
                      color: Color.fromARGB(251, 235, 177, 17),
                      fontWeight: FontWeight.w200,
                      fontSize: 30,
                    ),
                  )),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'We already send 4 digit verification number to your phone number, PLEASE FILL IN THE FORM BELOW ',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 245, 244, 245),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 245, 244, 245)),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 245, 244, 245)),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 245, 244, 245)),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 68,
                        width: 64,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 245, 244, 245)),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            textStyle: TextStyle(fontSize: 20),
                            backgroundColor: Color.fromARGB(255, 82, 6, 6),
                            foregroundColor:
                                const Color.fromARGB(255, 248, 253, 255),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Verify',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(150, 50),
                            textStyle: TextStyle(fontSize: 20),
                            elevation: 20, //<-- SEE HERE
                            side: BorderSide(
                                color: Color.fromARGB(255, 82, 6, 6), width: 3),
                            foregroundColor:
                                const Color.fromARGB(255, 248, 253, 255),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Resend code',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                    ],
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

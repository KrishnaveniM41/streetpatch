import 'package:flutter/material.dart';

import '../../homepage/dashboard.dart';

class tocPage extends StatefulWidget {
  const tocPage({super.key});

  @override
  State<tocPage> createState() => _tocPageState();
}

class _tocPageState extends State<tocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Terms and condtions',
                    style: TextStyle(
                      color: Color.fromARGB(251, 235, 177, 17),
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Introduction',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'These Terms and Conditions ("Agreement") govern your use of the Road Complaint App ("the App") developed by [Your Company Name] ("the Company"). By using the App, you agree to be bound by this Agreement. If you do not agree with these terms, please do not use the App.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                    Text(
                      '\n\n2. Use of the App',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'a.The App allows users to file road complaints by utilizing location and camera features. You must be at least 18 years old or have parental consent to use the App\n\nb. You are solely responsible for the accuracy and content of the complaints submitted through the App.\n\nc. The Company reserves the right to modify or discontinue the App at any time without prior notice.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                    Text(
                      '\n\n3. User Responsibilities',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'a. You agree not to use the App for any unlawful or unauthorized purposes.\n\nb. You agree not to upload or transmit any harmful or malicious content through the App.\n\nc. You are responsible for maintaining the confidentiality of your account credentials.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                    Text(
                      '\n\n4. Intellectual Property',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'a. All intellectual property rights related to the App, including but not limited to trademarks, copyrights, and patents, belong to the Company.\n\nb. You may not copy, modify, distribute, or reproduce any part of the App without prior written consent from the Company.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                    Text(
                      '\n\n5. Privacy',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'a. The App collects and uses location and camera data for the sole purpose of filing road complaints. The Company respects your privacy and handles all data in accordance with its Privacy Policy.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                    Text(
                      '\n\n6. Limitation of Liability',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'a. The Company is not liable for any direct, indirect, incidental, consequential, or punitive damages arising out of your use or inability to use the App.\n\nb. The Company does not guarantee the accuracy, reliability, or availability of the App or the complaints filed through it.',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 248, 253, 255),
                          fontWeight: FontWeight.w100,
                          fontSize: 15),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(110, 40),
                    textStyle: const TextStyle(fontSize: 18),
                    side: const BorderSide(
                        color: Color.fromARGB(250, 155, 115, 6), width: 3),
                    foregroundColor: const Color.fromARGB(255, 248, 253, 255),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return dashboard();
                    }));
                  },
                  child: const Text(
                    'I Agree',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}

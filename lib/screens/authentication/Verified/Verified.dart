import 'package:flutter/material.dart';

class verifyPage extends StatefulWidget {
  const verifyPage({super.key});

  @override
  State<verifyPage> createState() => _verifyPageState();
}

class _verifyPageState extends State<verifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Verified',
                style: TextStyle(
                  color: Color.fromARGB(251, 235, 177, 17),
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                )),
          )
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: camel_case_types
class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 10, 10, 10),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          //streetpatch
          SizedBox(height: 250),
          Text(
            'STREET PATCH',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 238, 224, 228)),
          ),
          SizedBox(height: 10),
          //sign up
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 114, 110, 110),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}

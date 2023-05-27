import 'package:flutter/material.dart';
import 'package:streetpatch/screens/homepage/feed.dart';

class tocPage extends StatefulWidget {
  const tocPage({super.key});

  @override
  State<tocPage> createState() => _tocPageState();
}

class _tocPageState extends State<tocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
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
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(110, 40),
                    textStyle: TextStyle(fontSize: 18),
                    side: BorderSide(
                        color: Color.fromARGB(250, 155, 115, 6), width: 3),
                    foregroundColor: const Color.fromARGB(255, 248, 253, 255),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return homePage();
                    }));
                  },
                  child: Text(
                    'I Agree',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

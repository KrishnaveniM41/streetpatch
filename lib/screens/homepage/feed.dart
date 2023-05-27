import 'package:flutter/material.dart';
import 'package:streetpatch/screens/homepage/view.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
            child: Container(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: SizedBox(
                        width: 170,
                        height: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 51, 54, 240)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 51, 54, 240))))),
                            onPressed: () {},
                            child: Text(
                              'Register Complaints',
                              style: TextStyle(
                                color: Color.fromARGB(248, 255, 255, 255),
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            )),
                      )),
                      Container(
                          child: SizedBox(
                        width: 170,
                        height: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(
                                    Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Color.fromARGB(249, 209, 154, 2)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        side: BorderSide(
                                            color: Color.fromARGB(
                                                249, 209, 154, 2))))),
                            onPressed: () {},
                            child: Text(
                              'Give \n Suggestions',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color.fromARGB(248, 255, 255, 255),
                              ),
                              textAlign: TextAlign.center,
                            )),
                      )),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 155, 15, 15)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 155, 15, 15))))),
                        onPressed: () {},
                        child: Text(
                          'Track Your complaint ',
                          style: TextStyle(
                            color: Color.fromARGB(248, 255, 255, 255),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  )),
                  SizedBox(height: 12),
                  Divider(
                    color: Color.fromARGB(255, 104, 9, 167),
                    thickness: 3,
                  ),
                  SizedBox(height: 12),

                  view(), //IMAGE POST CARD
                ],
              )),
        )));
  }
}
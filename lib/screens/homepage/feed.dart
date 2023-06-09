import 'package:flutter/material.dart';
import 'package:streetpatch/screens/homepage/view.dart';

import '../complaints/complaint.dart';
import '../suggestions/suggestions.dart';
import '../trackComplaints/track.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SafeArea(
            child: Container(
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
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
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    255, 51, 54, 240)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                side: const BorderSide(
                                                    color: Color.fromARGB(255, 51, 54, 240))))),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return const complaint();
                                      }));
                                    },
                                    child: const Text(
                                      'Register Complaints',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(248, 255, 255, 255),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              )),
                              SizedBox(width: 10),
                              Container(
                                  child: SizedBox(
                                width: 170,
                                height: 100,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(
                                            Colors.white),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color.fromARGB(
                                                    249, 209, 154, 2)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                side: const BorderSide(
                                                    color: Color.fromARGB(249, 209, 154, 2))))),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return SuggPage();
                                      }));
                                    },
                                    child: const Text(
                                      'Give \n Suggestions',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(248, 255, 255, 255),
                                      ),
                                      textAlign: TextAlign.center,
                                    )),
                              )),
                            ],
                          ))),
                  const SizedBox(height: 20),
                  Container(
                      child: SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 155, 15, 15)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(
                                        color: Color.fromARGB(
                                            255, 155, 15, 15))))),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return trackpage();
                          }));
                        },
                        child: const Text(
                          'Track Your complaint ',
                          style: TextStyle(
                            color: Color.fromARGB(248, 255, 255, 255),
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  )),
                  const SizedBox(height: 12),
                  const Divider(
                    color: Color.fromARGB(255, 104, 9, 167),
                    thickness: 3,
                  ),
                  const SizedBox(height: 12),

                  const view(), //IMAGE POST CARD
                ],
              )),
        )));
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:streetpatch/screens/homepage/CarouselSliderFromFirestore.dart';

class view extends StatefulWidget {
  final snap;
  const view({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/pothhole.jpeg'},
    {"id": 2, "image_path": 'assets/images/pothole2.jpg'},
    {"id": 3, "image_path": 'assets/images/Zebra.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            SizedBox(height: 50),
            Container(
              child: MyCarouselSlider(),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  SizedBox(height: 10),
                  Text(
                    'Requester:',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 255, 255, 255)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.snap['preferred_username'],
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 199, 132, 7)),
                  )
                ])),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Text(
                    'Phone number:',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 255, 255, 255)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.snap['preferred_phone'],
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 199, 132, 7)),
                  )
                ])),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Column(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Description:',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromARGB(248, 255, 255, 255)),
                      )),
                  const SizedBox(width: 10, height: 10),
                  Text(
                    widget.snap['description'],
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.5,
                        color: Color.fromARGB(248, 199, 132, 7)),
                  )
                ])),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Danger level:',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Color.fromARGB(248, 255, 255, 255)),
                      ),
                      SizedBox(width: 10),
                      Text(
                        widget.snap['dangerlevel'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromARGB(248, 255, 21, 4)),
                      ),
                      SizedBox(width: 45),
                      Container(
                          child: Row(children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = newBool;
                              });
                            }),
                        const Text(
                          'Fake',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                            color: Color.fromARGB(248, 255, 255, 255),
                          ),
                        )
                      ]))
                    ])),
            const Divider(
              height: 10,
              thickness: 2,
              indent: 10,
              endIndent: 0,
              color: Color.fromARGB(255, 145, 12, 122),
            )
          ]),
        ));
  }
}

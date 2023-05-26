import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class view extends StatefulWidget {
  const view({super.key});

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
        color: Color.fromARGB(75, 150, 140, 156),
        child: SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(children: [
            Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          print(currentIndex);
                        },
                        child: CarouselSlider(
                            items: imageList
                                .map((item) => Image.asset(
                                      item['image_path'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ))
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                                scrollPhysics: const BouncingScrollPhysics(),
                                autoPlay: true,
                                aspectRatio: 2,
                                viewportFraction: 1,
                                onPageChanged: ((index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                }))))
                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Text(
                    'Requester:',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 255, 255, 255)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Krishnaveni',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 199, 132, 7)),
                  )
                ])),
            Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                    '1234567895',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color.fromARGB(248, 199, 132, 7)),
                  )
                ])),
            Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Column(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Description:',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color.fromARGB(248, 255, 255, 255)),
                      )),
                  SizedBox(width: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum dui vel dapibus pulvinar. Vestibulum gravida leo lorem. Praesent condimentum felis eget lorem elementum, a consequat libero posuere. Sed faucibus metus in gravida aliquam. Mauris id nunc dictum, posuere nibh ut, faucibus dui. ',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18.5,
                        color: Color.fromARGB(248, 199, 132, 7)),
                  )
                ])),
            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                alignment: Alignment.topLeft,
                child: Row(children: [
                  Text(
                    'Danger level:',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color.fromARGB(248, 255, 255, 255)),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'High',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Color.fromARGB(248, 255, 21, 4)),
                  )
                ])),
            Container(
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (newBool) {
                        setState(() {
                          isChecked = newBool;
                        });
                      }),
                  Text(
                    'Fake',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Color.fromARGB(248, 255, 255, 255),
                    ),
                  )
                ]))
          ]),
        ));
  }
}

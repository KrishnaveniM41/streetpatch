import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class trackpage extends StatefulWidget {
  const trackpage({super.key});

  @override
  State<trackpage> createState() => _trackpageState();
}

class _trackpageState extends State<trackpage> {
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            leading: Icon(
              Icons.arrow_back_ios,
            ),
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(31, 198, 171, 171),
              ),
              title: Text('Your Complaints',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      height: 600,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(20),
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
                                          carouselController:
                                              carouselController,
                                          options: CarouselOptions(
                                              scrollPhysics:
                                                  const BouncingScrollPhysics(),
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
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              alignment: Alignment.topLeft,
                              child: const Row(children: [
                                Text(
                                  'STATUS:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                      color: Color.fromARGB(248, 179, 34, 34)),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'In Progress',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                      color: Color.fromARGB(248, 159, 33, 11)),
                                )
                              ])),
                          const SizedBox(
                            height: 10,
                          ),
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
                                          color:
                                              Color.fromARGB(248, 56, 25, 25)),
                                    )),
                                const SizedBox(width: 10),
                                const Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum dui vel dapibus pulvinar. Vestibulum gravida leo lorem. Praesent condimentum felis eget lorem elementum, a consequat libero posuere. Sed faucibus metus in gravida aliquam. Mauris id nunc dictum, posuere nibh ut, faucibus dui. ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18.5,
                                      color: Color.fromARGB(248, 14, 13, 12)),
                                )
                              ])),
                          const SizedBox(height: 20),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              alignment: Alignment.topLeft,
                              child: const Row(children: [
                                SizedBox(height: 80),
                                Text(
                                  'Danger level:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Color.fromARGB(248, 10, 10, 10)),
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
                        ],
                      ))),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                      height: 600,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.all(20),
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
                                          carouselController:
                                              carouselController,
                                          options: CarouselOptions(
                                              scrollPhysics:
                                                  const BouncingScrollPhysics(),
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
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              alignment: Alignment.topLeft,
                              child: const Row(children: [
                                Text(
                                  'STATUS:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                      color: Color.fromARGB(248, 179, 34, 34)),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 25,
                                      color: Color.fromARGB(248, 159, 33, 11)),
                                )
                              ])),
                          const SizedBox(
                            height: 10,
                          ),
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
                                          color:
                                              Color.fromARGB(248, 62, 34, 34)),
                                    )),
                                const SizedBox(width: 10),
                                const Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi bibendum dui vel dapibus pulvinar. Vestibulum gravida leo lorem. Praesent condimentum felis eget lorem elementum, a consequat libero posuere. Sed faucibus metus in gravida aliquam. Mauris id nunc dictum, posuere nibh ut, faucibus dui. ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18.5,
                                      color: Color.fromARGB(248, 14, 13, 12)),
                                )
                              ])),
                          const SizedBox(height: 20),
                          Container(
                              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              alignment: Alignment.topLeft,
                              child: const Row(children: [
                                SizedBox(height: 80),
                                Text(
                                  'Danger level:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 24,
                                      color: Color.fromARGB(248, 10, 10, 10)),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Medium',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color.fromARGB(248, 255, 21, 4)),
                                )
                              ])),
                        ],
                      ))),
            ),
          )
        ],
      ),
    );
  }
}

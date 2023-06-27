import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:streetpatch/screens/homepage/CarouselSliderFromFirestore.dart';

class trackpage extends StatefulWidget {
  final dynamic snap;
  final List<String> pictureDataList;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic city;
  final dynamic country;
  final dynamic state;
  final dynamic date;
  final dynamic time;
  final dynamic address;

  const trackpage({
    Key? key,
    required this.snap,
    required this.pictureDataList,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.country,
    required this.state,
    required this.date,
    required this.time,
    required this.address,
  }) : super(key: key);

  @override
  State<trackpage> createState() => _TrackPageState();
}

class _TrackPageState extends State<trackpage> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          CarouselSliderFromFirestore(widget.pictureDataList),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Row(
                                            children: [
                                              Icon(Icons.location_on,
                                                  color: Color.fromARGB(
                                                      248, 248, 19, 19)),
                                              Text(
                                                widget.address,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 15,
                                                  color: Color.fromARGB(
                                                      248, 224, 223, 222),
                                                ),
                                              )
                                            ],
                                          )),
                                          Text(
                                            ',',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                          Text(
                                            widget.city,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  248, 224, 223, 222),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Text(
                                            ',',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 253, 253, 253),
                                            ),
                                          ),
                                          Text(
                                            widget.state,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  248, 224, 223, 222),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Row(
                                        children: [
                                          Text(
                                            ',',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 255, 249, 249),
                                            ),
                                          ),
                                          Text(
                                            widget.country,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  248, 224, 223, 222),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SizedBox(height: 5),
                                        Text(
                                          'Date:',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                104, 255, 255, 255),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          widget.date,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                248, 224, 223, 222),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        'Time:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              104, 255, 255, 255),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        widget.time,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              248, 224, 223, 222),
                                        ),
                                      )
                                    ],
                                  )),
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        'Latitude:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              104, 255, 255, 255),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        widget.latitude.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              248, 224, 223, 222),
                                        ),
                                      )
                                    ],
                                  )),
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        'Longitude:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 14,
                                          color: Color.fromARGB(
                                              104, 255, 255, 255),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        widget.longitude.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              248, 224, 223, 222),
                                        ),
                                      )
                                    ],
                                  ))
                                ],
                              ), //this column
                            ],
                          )),
                      SizedBox(width: 70),
                    ],
                  ),
                )),
                Row(children: [
                  Text(
                    'Danger level:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color.fromARGB(85, 235, 231, 231),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.snap['dangerlevel'],
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                      color: Color.fromARGB(253, 255, 255, 255),
                    ),
                  ),
                ]),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      SizedBox(width: 10, height: 10),
                      Text(
                        widget.snap['description'],
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Color.fromARGB(132, 255, 254, 254),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(children: [
                  Text(
                    'STATUS:',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color.fromARGB(85, 235, 231, 231),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.snap['status'],
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                      color: Color.fromARGB(252, 221, 135, 5),
                    ),
                  ),
                ]),
                Divider(
                  color: Color.fromARGB(255, 60, 97, 218),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

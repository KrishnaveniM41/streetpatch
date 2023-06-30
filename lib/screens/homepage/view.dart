import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:streetpatch/screens/homepage/CarouselSliderFromFirestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

//import 'feed.dart';
class PatchView extends StatefulWidget {
  final dynamic snap;
  final List<String>? pictureDataList;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic city;
  final dynamic country;
  final dynamic state;
  final dynamic date;
  final dynamic time;
  final dynamic address;
  final dynamic complaintid;
  final dynamic userid;

  PatchView(
      {Key? key,
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
      required this.complaintid,
      required this.userid})
      : super(key: key);

  @override
  _PatchViewState createState() => _PatchViewState();
}

class _PatchViewState extends State<PatchView> {
  bool isButtonDisabled = false;

  void _disableButton() {
    setState(() {
      isButtonDisabled = true;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked = prefs.getBool('checkboxState') ?? false;
    });
  }

  final CarouselController carouselController = CarouselController();
  bool? isChecked = false;

  void openGoogleMaps(latitude, longitude) async {
    // dynamic latitude=latitude;
    //  dynamic longitude=widget.longitude;
    //print(latitude);print(longitude);print("spaaacce");
    if (latitude != null && longitude != null) {
      final Uri url = Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

      if (await launchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch Google Maps.';
      }
    }
  }

  void updateFakeCount(bool isChecked) async {
    int updatedCount =
        isChecked ? widget.snap['fake'] + 1 : widget.snap['fake'] - 1;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userid)
        .collection('complaints')
        .doc(widget.complaintid)
        .update({'fake': updatedCount});

    print("fake count updated");
    print(updatedCount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: SizedBox(
            width: double.infinity,
            child: Column(children: [
              Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(190, 223, 128, 4),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Requester:',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 20,
                        color: Color.fromARGB(104, 255, 255, 255),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.snap['preferred_username'],
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 20,
                        color: Color.fromARGB(248, 224, 223, 222),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      'Phone number:',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Color.fromARGB(134, 255, 255, 255),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      widget.snap['preferred_phone'],
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                        color: Color.fromARGB(248, 224, 223, 222),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              CarouselSliderFromFirestore(widget.pictureDataList),
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
                                        color:
                                            Color.fromARGB(104, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      widget.time,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(248, 224, 223, 222),
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
                                        color:
                                            Color.fromARGB(104, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      widget.latitude.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(248, 224, 223, 222),
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
                                        color:
                                            Color.fromARGB(104, 255, 255, 255),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      widget.longitude.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(248, 224, 223, 222),
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            ), //this column
                          ],
                        )),
                    SizedBox(width: 70),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            openGoogleMaps(widget.latitude, widget.longitude);
                          },
                          child: Icon(
                            Icons.directions,
                            color: const Color.fromARGB(108, 255, 255, 255),
                            size: 40.0,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(
                              side: BorderSide(
                                color: Color.fromARGB(
                                    181, 230, 135, 12), // Set the border color
                                width: 0.5, // Set the border width
                              ),
                            ),
                            backgroundColor: const Color.fromARGB(255, 0, 0,
                                0), // Set the button background color
                          ),
                        ),
                        Text(
                          'Directions',
                          style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 12,
                            color: Color.fromARGB(218, 204, 16, 16),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
              Divider(
                indent: 20,
                endIndent: 20,
                color: Color.fromARGB(96, 175, 168, 168),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(10.0),
                                  backgroundColor: isButtonDisabled
                                      ? Colors.grey
                                      : Color.fromARGB(134, 149, 144, 150),
                                ),
                                child: Text(
                                  'Report',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                onPressed: isButtonDisabled
                                    ? null
                                    : () {
                                        _disableButton();
                                        // Add your functionality here
                                      },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), //this
                  ],
                ),
              ),
              SizedBox(height: 40),
            ])));
  }
}

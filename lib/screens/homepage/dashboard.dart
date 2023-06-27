import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:streetpatch/screens/complaints/complaint.dart';
import 'package:streetpatch/screens/homepage/feed.dart';
import 'package:streetpatch/screens/suggestions/suggestions.dart';
import 'package:streetpatch/screens/trackComplaints/track.dart';

import '../trackComplaints/treakfeed.dart';
import 'home.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          backgroundColor: Colors.black,
          elevation: 50.0,
          leading: IconButton(
            padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {},
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 170.0,
                        height: 170.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                134, 149, 144, 150), // Background color
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/home.png', // image path
                                  width: 65.0, // image width
                                  height: 65.0, //  image height
                                ),
                                SizedBox(height: 10.0), //image and text
                                Text(
                                  'Home',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'View all complaints',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 170.0,
                        height: 170.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                134, 149, 144, 150), // Background color
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/complaint.png', // image path
                                  width: 60.0, // image width
                                  height: 60.0, //  image height
                                ),
                                SizedBox(height: 10.0), //image and text
                                Text(
                                  'Complaint Box',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  textAlign: TextAlign.center,
                                  'Register your complaints',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return complaint();
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 170.0,
                        height: 170.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                134, 149, 144, 150), // Background color
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/suggestion.png', // image path
                                  width: 75.0, // image width
                                  height: 75.0, //  image height
                                ),
                                SizedBox(height: 10.0), //image and text
                                Text(
                                  'Suggestion Box',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Give your suggestions',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SuggPage();
                            }));
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 170.0,
                        height: 170.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                134, 149, 144, 150), // Background color
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/trackcomplaint.jpeg', // image path
                                  width: 70.0, // image width
                                  height: 70.0, //  image height
                                ),
                                SizedBox(height: 10.0), //image and text
                                Text(
                                  'Track Complaints',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Track your Complaints',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return TrackFeedPage();
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Lottie.asset('animations/98072-travel-car-city.json')
                ],
              )),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:streetpatch/screens/complaints/complaint.dart';
import 'package:streetpatch/screens/homepage/feed.dart';
import 'package:streetpatch/screens/suggestions/suggestions.dart';
import 'package:streetpatch/screens/trackComplaints/track.dart';
import 'package:streetpatch/screens/trackComplaints/treakfeed.dart';

import 'home.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

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
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double availableWidth = constraints.maxWidth;

              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            backgroundColor: Color.fromARGB(
                              134,
                              149,
                              144,
                              150,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/home.png',
                                width: 65.0,
                                height: 65.0,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Home',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'View all complaints',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return Home();
                              }),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            backgroundColor: Color.fromARGB(
                              134,
                              149,
                              144,
                              150,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/complaint.png',
                                width: 60.0,
                                height: 60.0,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Complaint Box',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'Register your complaints',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return complaint();
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            backgroundColor: Color.fromARGB(
                              134,
                              149,
                              144,
                              150,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/suggestion.png',
                                width: 75.0,
                                height: 75.0,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Suggestion Box',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'Give your suggestions',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return SuggPage();
                              }),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(10.0),
                            backgroundColor: Color.fromARGB(
                              134,
                              149,
                              144,
                              150,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/trackcomplaint.jpeg',
                                width: 70.0,
                                height: 70.0,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                'Track Complaints',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'Track your Complaints',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return TrackFeedPage();
                              }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Lottie.asset('animations/98072-travel-car-city.json'),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

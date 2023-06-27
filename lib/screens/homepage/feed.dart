import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:streetpatch/screens/homepage/view.dart';
import 'package:streetpatch/screens/homepage/CarouselSliderFromFirestore.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Home'),
            backgroundColor: Colors.grey[800],
            floating: true,
            pinned: true,
          ),
          SliverFillRemaining(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return Text('No data available');
                }

                final userDocs = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: userDocs.length,
                  itemBuilder: (context, index) {
                    final userData = userDocs[index].data();
                    final userId = userDocs[index].id;

                    final complaintsCollection = FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId)
                        .collection('complaints');

                    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: complaintsCollection.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (!snapshot.hasData) {
                          return Text('No complaints available');
                        }

                        final complaintDocs = snapshot.data!.docs;

                        if (complaintDocs.isEmpty) {
                          return Text('No complaints available for this user');
                        }

                        return Column(
                          children: [
                            for (final complaintDoc in complaintDocs)
                              StreamBuilder<
                                  QuerySnapshot<Map<String, dynamic>>>(
                                stream: complaintsCollection
                                    .doc(complaintDoc.id)
                                    .collection('pictures')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  }

                                  if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }

                                  if (!snapshot.hasData) {
                                    return Text('No pictures available');
                                  }

                                  final pictureDocs = snapshot.data!.docs;
                                  print(
                                      "alooooooooooooooooooooooooooooooooooooooooooooo");
                                  print(pictureDocs);
                                  final pictureDataList = pictureDocs
                                      .map((picture) =>
                                          picture['imageURL'] as String)
                                      .toList();

                                  for (final PictureDoc in pictureDocs) {
                                    print(PictureDoc.data());
                                    final pictureData = PictureDoc.data();
                                    print(pictureData);
                                    final latitude =
                                        PictureDoc.data()['latitude'];
                                    final longitude =
                                        PictureDoc.data()['longitude'];
                                    final city = PictureDoc.data()['city'];
                                    final country =
                                        PictureDoc.data()['country'];
                                    final state = PictureDoc.data()['state'];
                                    final date = PictureDoc.data()['date'];
                                    final time = PictureDoc.data()['time'];
                                    final address =
                                        PictureDoc.data()['address'];
                                    //final complaintid = complaintDoc.id;
                                    print(latitude);
                                    print(longitude);

                                    print(pictureDataList);
                                    print("here");
                                    return Column(
                                      children: [
                                        PatchView(
                                            snap: complaintDoc.data(),
                                            pictureDataList: pictureDataList,
                                            latitude: latitude,
                                            longitude: longitude,
                                            city: city,
                                            country: country,
                                            state: state,
                                            date: date,
                                            time: time,
                                            address: address,
                                            complaintid: complaintDoc.id),
                                      ],
                                    );
                                  }
                                  return SizedBox
                                      .shrink(); // Placeholder widget if no pictures available
                                },
                              ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

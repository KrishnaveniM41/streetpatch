import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:streetpatch/screens/trackComplaints/track.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streetpatch/screens/homepage/CarouselSliderFromFirestore.dart';

class TrackFeedPage extends StatefulWidget {
  const TrackFeedPage({Key? key}) : super(key: key);

  @override
  _TrackFeedPageState createState() => _TrackFeedPageState();
}

class _TrackFeedPageState extends State<TrackFeedPage> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    late String? currentUserid = user?.uid;
    print(currentUserid);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
            leading: Icon(Icons.arrow_back_ios),
            expandedHeight: 200,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(31, 198, 171, 171),
              ),
              title: Text(
                'Your Complaints',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45),
              ),
            ),
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(currentUserid) // Filter by the current user's ID
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (snapshot.hasError) {
                return SliverFillRemaining(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              final userData = snapshot.data!.data();

              if (userData == null) {
                return SliverFillRemaining(
                  child: Text('User data not found'),
                );
              }

              final complaintsCollection = FirebaseFirestore.instance
                  .collection('users')
                  .doc(currentUserid)
                  .collection('complaints');

              return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: complaintsCollection.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return SliverFillRemaining(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  final complaintDocs = snapshot.data!.docs;

                  if (complaintDocs.isEmpty) {
                    return SliverFillRemaining(
                      child: Text('No complaints available'),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final complaintDoc = complaintDocs[index];
                        return StreamBuilder<
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

                            final pictureDocs = snapshot.data!.docs;
                            final pictureDataList = pictureDocs
                                .map((picture) => picture['imageURL'] as String)
                                .toList();

                            for (final PictureDoc in pictureDocs) {
                              print(PictureDoc.data());
                              final pictureData = PictureDoc.data();
                              print(pictureData);
                              final latitude = PictureDoc.data()['latitude'];
                              final longitude = PictureDoc.data()['longitude'];
                              final city = PictureDoc.data()['city'];
                              final country = PictureDoc.data()['country'];
                              final state = PictureDoc.data()['state'];
                              final date = PictureDoc.data()['date'];
                              final time = PictureDoc.data()['time'];
                              final address = PictureDoc.data()['address'];

                              print(latitude);
                              print(longitude);

                              print(pictureDataList);
                              print("here");
                              return Column(
                                children: [
                                  trackpage(
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
                                  ),
                                ],
                              );
                            }
                            return SizedBox.shrink();
                          },
                        );
                      },
                      childCount: complaintDocs.length,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

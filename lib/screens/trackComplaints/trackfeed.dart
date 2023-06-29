import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:streetpatch/screens/trackComplaints/track.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:streetpatch/screens/homepage/CarouselSliderFromFirestore.dart';

class TrackFeedPage extends StatefulWidget {
  const TrackFeedPage({Key? key}) : super(key: key);
 

  @override
  // ignore: library_private_types_in_public_api
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
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserid) // Filter by the current user's ID
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          final userData = snapshot.data!.data();

          if (userData == null) {
            return Text('User data not found');
          }

          final complaintsCollection = FirebaseFirestore.instance
              .collection('users')
              .doc(currentUserid)
              .collection('complaints');

          return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: complaintsCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final complaintDocs = snapshot.data!.docs;

              if (complaintDocs.isEmpty) {
                return Text('No complaints available');
              }

              return Column(
                children: [
                  for (final complaintDoc in complaintDocs)
                    StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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

                        return Column(
                          children: [
                            trackpage(
                              snap: complaintDoc.data(),
                              pictureDataList: pictureDataList,
                            ),
                          ],
                        );
                      },
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

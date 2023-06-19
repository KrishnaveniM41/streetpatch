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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
                  if (snapshot.connectionState == ConnectionState.waiting) {
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

                            if (!snapshot.hasData) {
                              return Text('No pictures available');
                            }

                            final pictureDocs = snapshot.data!.docs;
                            final pictureDataList = pictureDocs
                            .map((picture) =>
                                    picture['imageURL'] as String)
                                .toList();
print(pictureDataList);print("here");
                            return Column(
                              children: [
                                PatchView(
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
          );
        },
      ),
    );
  }
}

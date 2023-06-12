import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarouselSlider extends StatefulWidget {
  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      fetchSubcollections() async {
    final mainCollectionRef = FirebaseFirestore.instance.collection('users');
    final mainDocumentRef = mainCollectionRef.doc('user_id');

    final subcollection1Ref =
        mainDocumentRef.collection('complaints').doc().collection('pictures');

    final subcollection1QuerySnapshot = await subcollection1Ref.get();

    final subcollection1Docs = subcollection1QuerySnapshot.docs;

    return subcollection1Docs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
      future: fetchSubcollections(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return Text('No data available');
        }

        final subcollections = snapshot.data!;

        return CarouselSlider(
          options: CarouselOptions(height: 200),
          items: subcollections.map((subcollection) {
            final imageUrl = subcollection.data()['imageURL'];

            return Image.network(imageUrl);
          }).toList(),
        );
      },
    );
  }
}

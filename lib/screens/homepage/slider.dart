import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late Stream<QuerySnapshot> imageStream;
  int currentSlideIndex = 0;
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    var firebase = FirebaseFirestore.instance;
    imageStream = firebase.collection("Image_Slider").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
              stream: imageStream,
              builder: (_, snapshot) {
                if (snapshot.hasData && snapshot.data!.docs.length > 1) {
                  return CarouselSlider.builder(
                      carouselController: carouselController,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (_, index, ___) {
                        DocumentSnapshot sliderImage =
                            snapshot.data!.docs[index];
                        return Image.network(
                          sliderImage['imageURL'],
                          fit: BoxFit.contain,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        onPageChanged: (index, _) {
                          setState(() {
                            currentSlideIndex = index;
                          });
                        },
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            ' Current Slide Index $currentSlideIndex',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

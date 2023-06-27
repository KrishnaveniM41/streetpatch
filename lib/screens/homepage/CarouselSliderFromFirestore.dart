import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class CarouselSliderFromFirestore extends StatelessWidget {
  final List<String>? pictureDataList;
  const CarouselSliderFromFirestore(this.pictureDataList);

  @override
  Widget build(BuildContext context) {
    if (pictureDataList == null) {
      // Handle the case when there are no pictures to show
      return Container(
        width: MediaQuery.of(context).size.width,
        height: 200, // Adjust the height according to your needs
        color: Colors.grey, // Placeholder color
        child: Center(
          child: Text(
            'No pictures to display',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1,
                viewportFraction: 1,
                autoPlay: true,
              ),
              items: pictureDataList!.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: Container(
                              width: 150,
                              child: Lottie.asset('animations/gray.json'),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}

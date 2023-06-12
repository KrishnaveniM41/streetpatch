// SUGGESTION.DART
import 'package:flutter/material.dart';
import '../complaints/controller.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
//import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_grid_view/image_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../geotag/geotag.dart';

import '../homepage/feed.dart';

class SuggPage extends StatefulWidget {
  const SuggPage({super.key});

  @override
  State<SuggPage> createState() => _SuggPageState();
}

class _SuggPageState extends State<SuggPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String suggestionId = "";

  GeotagPage geotag = GeotagPage();

  Future<void> addSuggestionToUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? userId = user?.uid;

    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    DocumentReference userRef = usersCollection.doc(userId);
    CollectionReference suggestionsCollection =
        userRef.collection('suggestions');
    Map<String, dynamic> suggestionData = {
      'preferred_username': usernameController.text,
      'preferred_phone': phonenoController.text,
      'description': descriptionController.text,
    };

    DocumentReference newSuggestionRef =
        await suggestionsCollection.add(suggestionData);

    suggestionId = newSuggestionRef.id;

    await geotag.linkPicturesToSuggestion(suggestionId);
  }

  var image;
  List imagearray = [];
  opengallary() async {
    image = await ImagePicker().pickImage(source: ImageSource.camera);
    imagearray.add(image);
    setState(() {
      imagearray;
    });
    //passing the image path for geotagging and storage
    // GeotagPage geotag= GeotagPage();
    await geotag.geotagImage(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 241, 238, 238),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return homePage();
                }));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(136, 125, 93, 25)),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200)),
          ),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          " Give Suggestions",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        CircleAvatar(
                          child: Icon(
                            Icons.app_registration,
                            color: Colors.white,
                          ),
                          radius: 20,
                          backgroundColor: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 238, 236),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintText: ' Enter your preferred username',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: phonenoController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 248, 248),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintText: ' Enter your phone number (optional)',
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: descriptionController,
                            maxLines: 7,
                            keyboardType: TextInputType.multiline,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "mandatory";
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Give descrption about your suggestion",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w400,
                              ),
                              // contentPadding: EdgeInsets.all(50),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Column(
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {
                            opengallary();
                          },
                          icon: Icon(Icons.camera_alt_outlined),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          label: Text(
                            "upload photo",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                      Container(
                        height: MediaQuery.of(context).size.height *
                            .2, //images height
                        // decoration: BoxDecoration(border: Border.all(width: 1)),
                        padding: EdgeInsets.all(5),
                        child: imagearray.isEmpty
                            ? Center(child: Text("no image"))
                            : GridView.count(
                                crossAxisCount: 3,
                                children:
                                    List.generate(imagearray.length, (index) {
                                  var img = imagearray[index];
                                  //  return Container(child: Image.file(img));
                                  return Container(
                                      child: Image.file(File(img!.path)));
                                }),
                              ),
                      ),
                    ],
                  )),
                ),

                //------------------------post---------------------------------------------------------------------------
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (formkey.currentState!.validate()) {}
                      });
                      addSuggestionToUser();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text(
                      "post",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

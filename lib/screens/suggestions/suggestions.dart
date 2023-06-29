import 'dart:async';

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

bool isAnimating = true;

//enum to declare 3 state of button
enum ButtonState { init, submitting, completed }

class SuggPage extends StatefulWidget {
  const SuggPage({super.key});

  @override
  State<SuggPage> createState() => _SuggPageState();
}

class _SuggPageState extends State<SuggPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ButtonState state = ButtonState.init;
  String suggestionId = "";
  Timer? timer;
  int countdownDuration = 30;
  bool isButtonDisabled = false;

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
    if (imagearray.length < 3) {
      imagearray.add(image);
      countdownDuration = 30;
      isButtonDisabled = true;
    } else {
      final snackBar = SnackBar(
        content: Text('The limit has been reached'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {});
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (countdownDuration == 0) {
        timer.cancel();
        setState(() {
          isButtonDisabled = false;
        });
      } else {
        setState(() {
          countdownDuration--;
        });
      }
    });
  }

  Future<void> onUploadButtonPressed() async {
    if (!isButtonDisabled) {
      opengallary();
      //passing the image path for geotagging and storage
      // GeotagPage geotag= GeotagPage();
      await geotag.geotagImage(image!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width;

    // update the UI depending on below variable values
    final isInit = isAnimating || state == ButtonState.init;
    final isDone = state == ButtonState.completed;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(235, 180, 180, 180),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return homePage();
                }));
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color.fromARGB(136, 125, 93, 25)),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200)),
          ),
          bottom: const PreferredSize(
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
                        SizedBox(
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
//----------------------upload photo----------------------------------------------------

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Wait for $countdownDuration seconds to take next photo',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: Color.fromARGB(255, 243, 57, 57)),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed:
                              isButtonDisabled ? null : onUploadButtonPressed,
                          icon: Icon(Icons.camera_alt_outlined),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          label: Text(
                            "Upload Photo",
                            style: TextStyle(
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height *
                                .2, // images height
                            padding: EdgeInsets.all(5),
                            child: imagearray.isEmpty
                                ? const Center(
                                    child: Text(
                                      "No image",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100,
                                      ),
                                    ),
                                  )
                                : GridView.count(
                                    crossAxisCount: 3,
                                    children: List.generate(
                                      imagearray.length,
                                      (index) {
                                        var img = imagearray[index];
                                        return Container(
                                          child: Image.file(File(img!.path)),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

//------------------------post---------------------------------------------------------------------------
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(40),
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      onEnd: () => setState(() {
                            isAnimating = !isAnimating;
                          }),
                      width: state == ButtonState.init ? buttonWidth : 70,
                      height: 60,
                      // If Button State is Submiting or Completed  show 'buttonCircular' widget as below
                      child:
                          isInit ? buildButton() : circularContainer(isDone)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, shape: const StadiumBorder()),
        onPressed: () async {
          addSuggestionToUser();
          // here when button is pressed
          // we are changing the state
          // therefore depending on state our button UI changed.
          setState(() {
            state = ButtonState.submitting;
          });

          //await 2 sec // you need to implement your server response here.
          await Future.delayed(Duration(seconds: 30));
          setState(() {
            state = ButtonState.completed;
          });
          await Future.delayed(Duration(seconds: 30));
          setState(() {
            state = ButtonState.init;
          });
        },
        child: const Text(
          'POST',
          style: TextStyle(color: Colors.black),
        ),
      );

  // this is custom Widget to show rounded container
  // here is state is submitting, we are showing loading indicator on container then.
  // if it completed then showing a Icon.

  Widget circularContainer(bool done) {
    final color = done ? Colors.green : Colors.blue;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: done
            ? const Icon(Icons.done, size: 50, color: Colors.white)
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}

import 'dart:async';

import '../geotag/geotag.dart';
import 'controller.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
//import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_grid_view/image_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool isAnimating = true;

//enum to declare 3 state of button
enum ButtonState { init, submitting, completed }

class complaint extends StatefulWidget {
  const complaint({super.key});

  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  TextEditingController complaintername = TextEditingController();
  TextEditingController complainterphone = TextEditingController();
  TextEditingController accidentoccur = TextEditingController();
  TextEditingController dangerlevel = TextEditingController();
  TextEditingController complainterdescrption = TextEditingController();
  ButtonState state = ButtonState.init;
  String? _radioVal;
  String? level;
  String complaintId = "";
  Timer? timer;
  int countdownDuration = 30;
  bool isButtonDisabled = false;

  GeotagPage geotag = GeotagPage();

  Future<void> addComplaintToUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? userId = user?.uid;

    var radioVal = _radioVal;
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    DocumentReference userRef = usersCollection.doc(userId);
    CollectionReference complaintsCollection = userRef.collection('complaints');
    Map<String, dynamic> complaintData = {
      'preferred_username': complaintername.text,
      'preferred_phone': complainterphone.text,
      'accidents': radioVal,
      'description': complainterdescrption.text,
      'dangerlevel': level,
      'status': "UNRESOLVED",
      'fake': 0,
    };
    // final CollectionReference complaints =
    // FirebaseFirestore.instance.collection('complaints');
    DocumentReference newComplaintRef =
        await complaintsCollection.add(complaintData);

    complaintId = newComplaintRef.id;

    await geotag.linkPicturesToComplaint(complaintId);
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(235, 180, 180, 180),

        //leading
        leading: IconButton(
            onPressed: () {},
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
                      Text(
                        " Register your complaint ",
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView(
            children: [
//--------------- name-----------------------------------------------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: complaintername,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your preferred username",
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ),
              //---------------phone number-----------------------------------------------------
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: complainterphone,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    // contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Enter your phone number(optional)",
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.black),
                  ),
                ),
              ),

//---------------------------any accident occur---------------------------------------------

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          const Text(
                            ' Any accident occur:  ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Radio(
                            value: "yes",
                            groupValue: _radioVal,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  _radioVal = value;
                                });
                              }
                            },
                          ),
                          const Text(
                            'Yes',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Radio(
                            value: "no",
                            groupValue: _radioVal,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  _radioVal = value;
                                });
                              }
                            },
                          ),
                          const Text(
                            'No ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
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

//--------------------------------------------descrption--------------------------------
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: complainterdescrption,
                          maxLines: 7,
                          keyboardType: TextInputType.multiline,

                          //  textAlignVertical: TextAlignVertical.top,
                          //   expands: true,
                          //   maxLines: null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Give descrption about your complaint",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.all(50),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //--------------danger level-------------------------------------------

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 80,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Danger level:',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        children: [
                          Radio(
                            value: "low",
                            groupValue: level,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  level = value;
                                });
                              }
                            },
                          ),
                          const Text(
                            'low',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Radio(
                            value: "medium",
                            groupValue: level,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  level = value;
                                });
                              }
                            },
                          ),
                          const Text(
                            'medium ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                          Radio(
                            value: "high",
                            groupValue: level,
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  level = value;
                                });
                              }
                            },
                          ),
                          const Text(
                            'high ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

// --------------------------upload photo----------------------------------------------------------
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
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        ),
                        label: const Text(
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
                    child: isInit ? buildButton() : circularContainer(isDone)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, shape: const StadiumBorder()),
        onPressed: () async {
          addComplaintToUser();
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

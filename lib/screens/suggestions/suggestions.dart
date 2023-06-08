import 'package:flutter/material.dart';

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
                TextField(
                  controller: descriptionController,
                  maxLines: 7,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    hintText: ' Give description about your suggestion',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 17,
                    ),
                    Text(' UPLOAD PHOTO :',
                        style: TextStyle(
                            color: Color.fromARGB(255, 212, 161, 177),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        icon:
                            Icon(Icons.camera_alt_rounded, color: Colors.white),
                        iconSize: 48,
                        onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

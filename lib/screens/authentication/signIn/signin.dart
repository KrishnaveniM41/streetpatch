import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../services/Auth_Service.dart';

import '../../homepage/home.dart';
import '../TOC/toc.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  int start = 90;
  bool wait = false;
  String buttonName = "Send";
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Sign In",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              textField(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              otpField(),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Send OTP again in ",
                      style:
                          TextStyle(fontSize: 16, color: Colors.yellowAccent),
                    ),
                    TextSpan(
                      text: "00:$start",
                      style: const TextStyle(
                          fontSize: 16, color: Colors.pinkAccent),
                    ),
                    const TextSpan(
                      text: " sec ",
                      style:
                          TextStyle(fontSize: 16, color: Colors.yellowAccent),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () async {
                  await signInWithPhoneNumber();
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffff9601),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xfffbe2ae),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithPhoneNumber() async {
    String smsCode = otpCodeController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdFinal, smsCode: smsCode);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Verification completed manually with the entered OTP, handle the signed-in user
      // You can navigate to a new screen or perform further actions
      // Store the user's phone number and user ID in Firestore
      String phoneNumber = phoneController.text.trim();
      String userId = FirebaseAuth.instance.currentUser!.uid;

      // Query the user collection to check if a document with the same phone number exists
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('phone_number', isEqualTo: phoneNumber)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Document already exists for this phone number
        print('User with the same phone number already exists!');
        // Handle the duplicate sign-in attempt or perform any other necessary action
      } else {
        // Document does not exist for this phone number, create a new document
        CollectionReference usersCollection =
            FirebaseFirestore.instance.collection('users');
        await usersCollection.doc(userId).set({
          'phone_number': phoneNumber,
          'user_id': userId,
        });
        print('New user document created!');
      }

      // Navigate to toc page on successful authentication
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const tocPage()),
      );
    } catch (e) {
      // Handle any errors that occur during the sign-in process
      print(e.toString());
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer timer = Timer.periodic(oneSec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 10,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: const Color(0xff1d1d1d),
        borderColor: Colors.white,
      ),
      style: const TextStyle(fontSize: 17, color: Colors.white),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: $pin");
        otpCodeController.text = pin; // Store the entered OTP in the controller
      },
    );
  }

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xff1d1d1d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: phoneController,
        style: const TextStyle(color: Colors.white, fontSize: 17),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone Number",
          hintStyle: const TextStyle(color: Colors.white54, fontSize: 17),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              " (+91) ",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () async {
                    setState(() {
                      start = 90;
                      wait = true;
                      buttonName = "Resend";
                    });
                    await verifyPhoneNumber(phoneController.text);
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                buttonName,
                style: TextStyle(
                  color: wait ? Colors.grey : Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$phoneNumber", // Prefixing the phone number with +91
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Verification completed automatically, handle the signed-in user
        // You can navigate to a new screen or perform further actions
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure, display an error message
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setData(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setData(verificationId);
      },
    );
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screens/quiz_question.dart';
import 'package:quizapp/screens/result_page.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252C4A),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Let's Play Quiz !!!",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                SizedBox(
                  height: 7,
                ),
                Text('Enter your name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                  hintText: 'Your Name',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Material(
                  color: Color(0xFF0BDAB0),
                  elevation: 6,
                  borderRadius: BorderRadius.circular(13),
                  child: MaterialButton(
                  minWidth: double.infinity,
                    onPressed: () {
                      Get.to(QuizQuestion());
                    },
                    child: Text('Start Quiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
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
}

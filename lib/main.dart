import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/screens/quiz_question.dart';
import 'package:quizapp/screens/result_page.dart';
import 'package:quizapp/screens/welcome_screen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}

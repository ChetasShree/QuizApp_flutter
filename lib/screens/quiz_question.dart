import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/components/body.dart';
import 'package:quizapp/controllers/question_controller.dart';


class QuizQuestion extends StatelessWidget {
  static const String id = 'quiz_question';

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Color(0xFF252C4A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text('Skip',style: TextStyle(color: Colors.white,fontSize: 20),)),
        ],
      ),
      body: Body(),
    );
  }
}


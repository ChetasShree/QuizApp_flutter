import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/components/option.dart';
import 'package:quizapp/controllers/question_controller.dart';
import 'package:quizapp/models/Questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key, required this.question,
  }) : super(key: key);
  final Question question;


  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ...List.generate(question.options.length, (index) => Option(
            index:index,text: question.options[index],
            press: ()=>_controller.checkAns(question, index),
          ),
          ),
        ],
      ),
    );
  }
}
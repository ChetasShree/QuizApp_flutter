import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controllers/question_controller.dart';

class ResultPage extends StatefulWidget {
  static const String id = 'result_page';

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Color(0xFF252C4A),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Well Played !!!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Score',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 2,
                decoration: TextDecoration.underline,
                fontSize: 40,
                fontStyle: FontStyle.italic,
              ),),
              SizedBox(
                height: 30,
              ),
              Text(
                '${_qnController.correctAns*10}/${_qnController.questions.length*10}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                ),
                //"${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

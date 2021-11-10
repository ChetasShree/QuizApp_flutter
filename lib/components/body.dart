import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/components/progress_bar.dart';
import 'package:quizapp/components/question_card.dart';
import 'package:quizapp/controllers/question_controller.dart';
import 'package:quizapp/models/Questions.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questioncontroller = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ProgressBar(),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Obx(()=>Text.rich(
                  TextSpan(
                    text: 'Question ${_questioncontroller.questionNumber.value}',
                    style: TextStyle(
                      color: Color(0xFF8B94BC),
                      fontSize: 30,
                    ),
                    children: [
                      TextSpan(text:"/${_questioncontroller.questions.length}",style: TextStyle(color: Color(0xFF8B94BC),
                        fontSize: 30,),),
                    ],
                  ),
                ),),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child:PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questioncontroller.pageController,
                    onPageChanged: _questioncontroller.updateTheQnNumber,
                    itemCount: _questioncontroller.questions.length,
                      itemBuilder: (context,index)=>QuestionCard(question: _questioncontroller.questions[index])
                  ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}




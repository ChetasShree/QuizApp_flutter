import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quizapp/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF3F4768),width: 3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: GetBuilder<QuestionController>(
        init:QuestionController(),
        builder: (controller) {
          print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(builder: (context,constrains)=>Container(
                width:constrains.maxWidth*controller.animation.value,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              ),
              Positioned.fill(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${(controller.animation.value*60).round()} sec',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        Icon(Icons.access_alarm_outlined,color: Colors.white,),
                      ],
                    ),
                  )),
            ],
          );
        }
      ),
    );
  }
}

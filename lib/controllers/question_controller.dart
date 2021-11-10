import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quizapp/models/Questions.dart';
import 'package:quizapp/screens/result_page.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;
  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data.map((question) => Question(
    id: question['id'],
    question: question['question'],
    options: question['options'],
    answer: question['answer_index'],
  )).toList();
  List<Question> get questions => this._questions;

  late bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns =>this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  late RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  late int _numOfCorrectAns=0;
  int get numOfCorrectAns => this._numOfCorrectAns;


  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _pageController = PageController();
    _animationController.forward().whenComplete(nextQuestion);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }
  void checkAns(Question question,int selectedIndex ){
    _isAnswered =  true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if(_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(Duration(seconds: 3),(){
     nextQuestion();
    });
  }
  void nextQuestion(){
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(duration: Duration(milliseconds: 150), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    }
    else{
      Get.to(ResultPage());
    }
  }
  void updateTheQnNumber(int index){
    _questionNumber.value = index+1;
  }
}
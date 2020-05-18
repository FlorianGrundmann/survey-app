import 'package:flutter/material.dart';
import 'package:survey_app/features/questions/presentation/pages/question_page.dart';

class MainQuestionPage extends StatefulWidget {
  @override
  _MainQuestionPageState createState() => _MainQuestionPageState();
}

class _MainQuestionPageState extends State<MainQuestionPage> {
  List<String> questions = [
    'Es war zu viel Text auf den Folien.',
    'Die Stimme des Sprechers war angenehm.',
    'Der Sprecher sprach zu schnell oder undeutlich.',
  ];
  int currentQuestion = 0;

  void onNext(int value) {
    setState(() {
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return QuestionPage(
      question: questions[currentQuestion],
      onNext: onNext,
      currentQuestion: currentQuestion + 1,
      numberQuestions: questions.length,
    );
  }
}

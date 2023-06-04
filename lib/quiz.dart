import 'package:flutter/material.dart';
import 'package:quiz_flutter/data/questions.dart';
import 'package:quiz_flutter/start_screen.dart';
import 'package:quiz_flutter/questions_screen.dart';
import 'package:quiz_flutter/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = "start-screen";

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
  }

  void swichScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {
    Widget currentWidget = StartScreen(swichScreen);
    if (activeScreen == "questions-screen") {
      currentWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == "result-screen") {
      currentWidget = ResultScreen(
        restartQuiz: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 47, 4, 99),
                Color.fromARGB(255, 44, 71, 144),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          child: currentWidget,
        ),
      ),
    );
  }
}

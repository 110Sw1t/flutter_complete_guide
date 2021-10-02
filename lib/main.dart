import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questions = [
    Question(
        questionStatement: "What is your favorite club?",
        answers: ["Ahly", "Zamalek", "Liverpool", "FC Barcelona"]),
    Question(
        questionStatement:
            "What is the most titled club in Africa in the 20th century?",
        answers: ["Ahly", "Zamalek"]),
    Question(
        questionStatement: "Which is better to have cat or dog?",
        answers: ["Cat", "Dog"])
  ];

  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    void onPressedHandler() {
      setState(() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
      });
    }

    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 200, 0),
      appBar: AppBar(
        title: const Text('My Beautiful App'),
      ),
      body: QuestionForm(
        action: onPressedHandler,
        question: questions.elementAt(currentQuestionIndex),
      ),
    ));
  }
}

class QuestionForm extends StatelessWidget {
  final Question question;
  final void Function() action;
  const QuestionForm({Key? key, required this.question, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var elements = <Widget>[Text(question.questionStatement)];
    elements.addAll(question.answers.map((e) => ElevatedButton(
          onPressed: action,
          child: Text(e),
          key: Key(e),
        )));
    return Column(
      children: elements,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}

class Question {
  String questionStatement;
  List<String> answers = [];
  Question({required this.questionStatement, required this.answers});
}

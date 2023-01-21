import 'package:flutter/material.dart';
import 'package:true_false/quiz.dart';

void main() {
  runApp(const MyApp());
}

// make a stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1D1E33),
        appBar: AppBar(
          title: const Text('True/False'),
          backgroundColor: const Color(0xFF0A0E21),
        ),
        body: Container(
          child: const QuizStateFull(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:true_false/logic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizLogic quizLogic = QuizLogic();

class QuizStateFull extends StatefulWidget {
  const QuizStateFull({Key? key}) : super(key: key);

  @override
  _QuizStateFullState createState() => _QuizStateFullState();
}

class _QuizStateFullState extends State<QuizStateFull> {
  List<Icon> score = [];
  int correct = 0;

  @override
  void checkAnswer(bool userPickedAnswer) {
    if (!quizLogic.isFinished()) {
      bool correctAnswer = quizLogic.getAnswer();
      if (userPickedAnswer == correctAnswer) {
        correct++;
        score.add(const Icon(Icons.check, color: Colors.green));
      } else {
        score.add(const Icon(Icons.close, color: Colors.red));
      }
      quizLogic.nextQuestion();
    }
    if (quizLogic.isFinished()) {
      score = [];
      quizLogic.reset();
      Alert(
        context: context,
        title: "Finished!",
        desc: "Score : $correct/4",
        type: AlertType.success,
        buttons: [
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
              quizLogic.reset();
              setState(() {
                score = [];
                correct = 0;
              });
            },
            child: const Text(
              "Restart",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            width: 120,
          )
        ],
      ).show();
      correct = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                quizLogic.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Row(
              children: score,
            ),
          ),
        ),
      ],
    );
  }
}

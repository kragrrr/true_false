import 'question.dart';

class QuizLogic {
  int questionNumber = 0;

  List<Question> questionBank = [
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Human Body has 204 bones', false),
    Question('The average person has two kidneys.', true),
  ];

  void nextQuestion() {
    if (questionNumber <= questionBank.length + 1) {
      questionNumber++;
    }
  }

  String getQuestionText() {
    return questionBank[questionNumber].questionText;
  }

  bool getAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }

  void reset() {
    questionNumber = 0;
  }

  bool isFinished() {
    if (questionNumber == questionBank.length - 1) {
      reset();
      return true;
    } else {
      return false;
    }
  }
}

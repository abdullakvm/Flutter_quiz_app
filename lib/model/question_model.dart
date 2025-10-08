class QuestionModel {
  String question;
  List<String> options;
  int answerindex;
 

  QuestionModel({
    required this.answerindex,
    required this.options,
    required this.question,
  });
}

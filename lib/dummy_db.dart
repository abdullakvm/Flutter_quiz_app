import 'package:quiz_app/model/question_model.dart';

class DummyDb {
 static List<QuestionModel> questions = [
    QuestionModel(
      question: "What is Flutter?",
      options: ["A database", "A programming language", "An SDK for building apps", "An operating system"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "Which language is primarily used to write Flutter apps?",
      options: ["Kotlin", "Java", "Dart", "Swift"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "Who developed Flutter?",
      options: ["Facebook", "Microsoft", "Apple", "Google"],
      answerindex: 3,
    ),
    QuestionModel(
      question: "Which widget is used to create infinite scrolling lists?",
      options: ["ListView.builder", "SingleChildScrollView", "GridView", "Column"],
      answerindex: 0,
    ),
    QuestionModel(
      question: "Which command is used to create a new Flutter project?",
      options: ["flutter run", "flutter new", "flutter create", "flutter init"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "What does the 'hot reload' feature do in Flutter?",
      options: ["Restarts the app", "Rebuilds widgets while keeping state", "Installs dependencies", "Clears cache"],
      answerindex: 1,
    ),
    QuestionModel(
      question: "Which widget is used for layouts in Flutter?",
      options: ["Scaffold", "Container", "Row & Column", "Text"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "Which of these is NOT a state management approach in Flutter?",
      options: ["Provider", "GetX", "Bloc", "Spring"],
      answerindex: 3,
    ),
    QuestionModel(
      question: "Which file in a Flutter project is used to manage dependencies?",
      options: ["main.dart", "pubspec.yaml", "gradle.properties", "AndroidManifest.xml"],
      answerindex: 1,
    ),
    QuestionModel(
      question: "What is the default function that runs first in Flutter apps?",
      options: ["start()", "runApp()", "main()", "init()"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "Which widget is commonly used for app design structure?",
      options: ["Scaffold", "MaterialApp", "SafeArea", "Container"],
      answerindex: 0,
    ),
    QuestionModel(
      question: "What widget is used to allow user input in Flutter?",
      options: ["Text", "InputField", "TextField", "Label"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "Which lifecycle method is called only once when a StatefulWidget is created?",
      options: ["dispose()", "build()", "initState()", "setState()"],
      answerindex: 2,
    ),
    QuestionModel(
      question: "Which widget is used to make elements scrollable?",
      options: ["Row", "ListView", "Stack", "Expanded"],
      answerindex: 1,
    ),
    QuestionModel(
      question: "What is the purpose of the setState() method?",
      options: ["Delete state", "Update the UI", "Initialize state", "Stop execution"],
      answerindex: 1,
    ),
  ];
}

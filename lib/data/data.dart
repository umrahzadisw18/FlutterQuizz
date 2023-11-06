import 'package:quiz_app/model/question.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "Who created Flutter?",
    {"Facebook": false, "Adobe": false, "Google": true, "Microsoft": false},
  ),
  QuestionModel(
    "What is Flutter?",
    {
      "Android Development Kit": false,
      "Ios Development Kit": false,
      "Web Development Kit": false,
      "SDK to build beautiful IOS, Android, Web & Desktop Native Apps": true
    },
  ),
  QuestionModel(
    "Which programming language is used by Flutter?",
    {
      "Ruby": false,
      "Dart": true,
      "C++": false,
      "Kotlin": false,
    },
  ),
  QuestionModel(
    "Who created Dart programming language?",
    {
      "Lars Bak and Kasper Lund": true,
      "Brendan Eich": false,
      "Bjarne Stroustrup": false,
      "Jeremy Ashkenas": false,
    },
  ),
  QuestionModel(
    "Is Flutter for Web and Desktop available in stable version?",
    {
      "Yes": false,
      "No": true,
    },
  ),
  QuestionModel(
    "How many types of widgets are there in Flutter?",
    {
      "6": false,
      "4": false,
      "2": true,
      "8": false,
    },
  ),
  QuestionModel(
    "Which function will return the widgets attached to the screen as a root of the widget tree to be rendered on screen?",
    {
      "main()": false,
      "runApp()": true,
      "container": false,
      "root()": false,
    },
  ),
  QuestionModel(
    "Which component allows us to specify the distance between widgets on the screen?",
    {
      "SafeArea": false,
      "table": false,
      "sizedbox": true,
      "Appbar": false,
    },
  ),
  QuestionModel(
    "What command would you run to verify your Flutter install and ensure your environment is set up correctly?",
    {
      "Flutter run": false,
      "Flutter build": false,
      "Flutter help": false,
      "Flutter doctor": true,
    },
  ),
  QuestionModel(
    "Which release mode will not contain any debugging data when run?",
    {
      "Profile": false,
      "Release": true,
      "Debug": false,
      "Test": false,
    },
  ),
];

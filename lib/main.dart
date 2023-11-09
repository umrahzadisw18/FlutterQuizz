import 'package:flutter/material.dart';
import 'package:quiz_app/answer_card.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // PageController? _controller = PageController(initialPage: 0);
  // bool isPressed = false;
  int? selectedAnswerIndex;
  int quesionIndex = 0;
  int score = 0;

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[quesionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score ++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (quesionIndex < questions.length - 1) {
      quesionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[quesionIndex];
    bool isLastQuestion = quesionIndex == questions.length - 1;
    return Scaffold(
        backgroundColor: Color(0xFF252c4a),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Question ${quesionIndex + 1}/${questions.length}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 28),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1.0,
                      height: 8.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      question.question,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: question.answer.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: selectedAnswerIndex == null
                                ? () => pickAnswer(index)
                                : null,
                            child: AnswerCard(
                              currentIndex: index,
                              question: question.answer[index],
                              isSelected: selectedAnswerIndex == index,
                              selectedAnswerIndex: selectedAnswerIndex,
                              correctAnswerIndex: question.correctAnswerIndex,
                            ),
                          );
                        }),
                    isLastQuestion
                        ? MaterialButton(
                            child: Text("Finish"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Result(score: score)));
                            },
                          )
                        : MaterialButton(
                            color: Colors.white24,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            onPressed: selectedAnswerIndex != null
                                ? goToNextQuestion
                                : null,
                          ),
                  ],
                ),
              )),
        ));
  }
}

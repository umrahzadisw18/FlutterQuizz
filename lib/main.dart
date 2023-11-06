import 'package:flutter/material.dart';
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
      home:  SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isFalse = Colors.red;
  Color btncolor = Colors.blue;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF252c4a),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller!,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Question ${index + 1}/${questions.length}",
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
                      questions[index].question!,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    for (int i = 0; i < questions[index].answer!.length; i++)
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 18.0),
                        child: MaterialButton(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            shape: StadiumBorder(),
                            color: isPressed
                                ? questions[index]
                                        .answer!
                                        .values
                                        .toList()[i]
                                        // .value
                                    ? isTrue
                                    : isFalse
                                : btncolor,
                            onPressed: () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answer!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              }
                            },
                            child: Text(
                              questions[index].answer!.keys.toList()[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )),
                      ),
                    SizedBox(
                      height: 50,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Colors.orange),
                        ),
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Result(
                                                  score: score,
                                                )));
                                  }
                                : () {
                                    _controller!.nextPage(
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.linear);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        child: Text(
                          index + 1 == questions.length
                              ? "See Result"
                              : "Next Question",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

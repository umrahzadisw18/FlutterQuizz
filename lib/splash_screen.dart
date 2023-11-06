import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.60,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                   color: Color(0xFF252c4a),
                  borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45)),
                ),
                child: Image.network("https://www.aptitudeclassguru.in/wp-content/uploads/2023/06/answer-300x300.png",
                scale: 1,),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.30,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Colors.white,
                ),
                child: Center(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Color(0xFF252c4a),
                      width: 2,)),
                    child: Text(
                      "Start Quizz",
                      style:TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                      color:  Color(0xFF252c4a),letterSpacing: 2),
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

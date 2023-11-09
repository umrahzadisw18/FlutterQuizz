import 'package:flutter/material.dart';
import 'package:quiz_app/data/data.dart';
import 'package:quiz_app/main.dart';

class Result extends StatefulWidget {
  final int score;
   Result({super.key, required this.score});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF252c4a),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
              (widget.score/questions.length*100).round() >= 50 ?
                'Congratulations,You Won🤩' : "You Loss ☹️,Try Again!", 
                style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              
              SizedBox(height: 5,),
              Text("Your score is", style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),),
                SizedBox(height: 50,),
              Stack
              (alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: widget.score/10,
                    color: Colors.green,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text("${widget.score}",style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              Text("${(widget.score/questions.length*100).round()}%",style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
                  ],
                )
              ],),
              SizedBox(height: 60,),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>MyHomePage()));
              },
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Repeat the Quiz", style: TextStyle(
                fontSize: 16
              ),),
              )
            ],
          ),
        ),
    );
  }
}
import 'package:flutter/material.dart';
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
                widget.score >= 50 ?
                'Congratulations,You Won🤩' : "You Loss ☹️,Try Again!", 
                style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
              
              SizedBox(height: 5,),
              Text("Your score is", style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w200,
              ),),
              SizedBox(height: 50,),
              Text("${widget.score}",style: TextStyle(
                fontSize: 38,
                color: Colors.orange,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 60,),
              MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>MyHomePage()));
              },
              color: Colors.orange,
              textColor: Colors.white,
              child: Text("Repeat the Quiz"),
              )
            ],
          ),
        ),
    );
  }
}
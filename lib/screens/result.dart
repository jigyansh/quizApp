import 'package:flutter/material.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/screens/quiz.dart';

class Result extends StatefulWidget {
  int score = 0,
      totalQuestions = 0,
      correct = 0,
      incorrect = 0,
      unAttempted = 0;
  Result(
      {this.correct,
      this.incorrect,
      this.score,
      this.totalQuestions,
      this.unAttempted});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String greeting = "";

  @override
  void initState() {
    // T
    super.initState();
    var percentage = (widget.score / (widget.totalQuestions * 20)) * 100;
    if (percentage >= 82) {
      greeting = "Outstanding!!";
    }
    if (percentage >= 72 && percentage < 82) {
      greeting = "Good Work!!";
    }
    if (percentage > 65 && percentage < 72) {
      greeting = "Nice Effort!!";
    }
    if (percentage <= 65) {
      greeting = "Needs improvement!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              greeting,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.blue),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "You scored ${widget.score ?? 0} out of ${widget.totalQuestions * 20 ?? 0}",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${widget.correct ?? 0} Correct, ${widget.incorrect ?? 0} incorrect & ${widget.unAttempted ?? 0} NotAttempted out of ${widget.totalQuestions}",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.2),
              ),
            ),
            SizedBox(
              height: 180,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: Text(
                    "Replay Quiz Now",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: Text(
                      "Go to Home",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

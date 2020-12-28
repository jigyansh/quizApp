// import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quiz/data/data.dart';
import 'package:quiz/model/model.dart';
import 'package:quiz/screens/result.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  // List<QuestionModel> _questions = new List<QuestionModel>();
  // int index = 0, correct = 0, incorrect = 0, unAttempted = 0, points = 0;
  // Animation animation;
  // AnimationController animationController;
  // double aniBegin = 0.0;
  // double aniEnd = 1.0;

  // @override
  // void initState() {
  //   super.initState();
  //   _questions = getQuestions();

  //   animationController =
  //       AnimationController(duration: const Duration(seconds: 5), vsync: this);

  //   animation =
  //       Tween(begin: aniBegin, end: aniEnd).animate(animationController);

  //   startAnim();
  //   animationController.addStatusListener((AnimationStatus status) {
  //     if (status == AnimationStatus.completed) {

  //       index++;
  //     }
  //   });
  // }

  // startAnim() {
  //   animationController.forward();
  // }

  // stopAnim() {
  //   animationController.stop();
  // }

  // resetAnim() {
  //   animationController.reset();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: 50,
  //           ),
  //           Row(
  //             children: [
  //               Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //                 child: Text(
  //                   "${index + 1}/${_questions.length}",
  //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Text(
  //                   "QUESTIONS",
  //                   style: TextStyle(color: Colors.grey[500], fontSize: 18),
  //                 ),
  //               ),
  //               Spacer(),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Text("0 Points"),
  //               ),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text("${_questions[index].getQuestion()}"),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           LinearProgressIndicator(
  //             value: animation.value,
  //           ),
  //           Image(
  //               image: CachedNetworkImageProvider(
  //                   "${_questions[index].getImageUrl()}")),
  //           Spacer(),
  //           Row(
  //             children: [
  //               Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  //                 child: Container(
  //                     decoration: BoxDecoration(
  //                         color: Colors.blue,
  //                         borderRadius: BorderRadius.circular(15)),
  //                     padding: const EdgeInsets.symmetric(
  //                         horizontal: 49, vertical: 20),
  //                     child: Text(
  //                       "True",
  //                       style: TextStyle(color: Colors.white),
  //                     )),
  //               ),
  //               Spacer(),
  //               Padding(
  //                 padding:
  //                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  //                 child: Container(
  //                     decoration: BoxDecoration(
  //                         color: Colors.red,
  //                         borderRadius: BorderRadius.circular(15)),
  //                     padding: const EdgeInsets.symmetric(
  //                         horizontal: 49, vertical: 20),
  //                     child: Text(
  //                       "False",
  //                       style: TextStyle(color: Colors.white),
  //                     )),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  List<QuestionModel> questions = new List<QuestionModel>();
  int index = 0;
  int points = 0;
  int correct = 0;
  int incorrect = 0;
  int unAttempted = 0;
  int total = 0;

  AnimationController controller;

  Animation animation;

  double beginAnim = 0.0;

  double endAnim = 1.0;

  @override
  void initState() {
    // T
    super.initState();

    questions = getQuestions();

    controller =
        AnimationController(duration: const Duration(seconds: 4), vsync: this);
    animation = Tween(begin: beginAnim, end: endAnim).animate(controller)
      ..addListener(() {
        setState(() {
          // Change here any Animation object value.
        });
      });

    startProgress();

    animation.addStatusListener((AnimationStatus animationStatus) {
      if (animationStatus == AnimationStatus.completed) {
        if (index < questions.length - 1) {
          total++;
          index++;
          resetProgress();
          startProgress();
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Result(
                        score: points,
                        totalQuestions: questions.length,
                        correct: correct,
                        incorrect: incorrect,
                        unAttempted: total,
                      )));
        }
      }
    });
  }

  startProgress() {
    controller.forward();
  }

  stopProgress() {
    controller.stop();
  }

  resetProgress() {
    controller.reset();
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
      // total++;
      resetProgress();
      startProgress();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Result(
                    score: points,
                    totalQuestions: questions.length,
                    correct: correct,
                    incorrect: incorrect,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "${index + 1}/${questions.length}",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Question",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      ),
                      // Text("${total + 1 - 1}"),
                    ],
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "$points",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              questions[index].getQuestion() + "?",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                child: LinearProgressIndicator(
              value: animation.value,
            )),
            CachedNetworkImage(
              imageUrl: questions[index].getImageUrl(),
            ),
            Spacer(),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (questions[index].getAnswer() == "True") {
                        setState(() {
                          points = points + 20;
                          nextQuestion();
                          correct++;
                        });
                      } else {
                        setState(() {
                          points = points - 5;
                          nextQuestion();
                          incorrect++;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "True",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      if (questions[index].getAnswer() == "False") {
                        // setState(() {
                        points = points + 20;
                        nextQuestion();
                        correct++;
                        // });
                      } else {
                        // setState(() {
                        points = points - 5;
                        nextQuestion();
                        incorrect++;
                        // });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(24)),
                      child: Text(
                        "False",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          SizedBox(
            height: 200,
          ),
          Text(
            "Let's Beginnn",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 35, color: Colors.red),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "be prepared....",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
          ),
          SizedBox(
            height: 250,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(15)),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 15),
                    child: Text(
                      "start the quiz",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

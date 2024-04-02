import 'package:flutter/material.dart';

class Quizapp extends StatefulWidget {
  const Quizapp({super.key});
  @override
  State createState() => _Quizapp();
}

class SingleQuestionModel {
  final String? questions;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.questions, this.answerIndex, this.options});
}

class _Quizapp extends State {
  bool questionScreen = true;
  int questionIndex = 0;
  int buttonIndex = 0;

  List allQuestions = [
    const SingleQuestionModel(
      questions: "Who is founder of Microsoft",
      options: ["Steve jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      questions: "Who is founder of Apple",
      options: ["Steve jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      questions: "Who is founder of Amazon",
      options: ["Steve jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      questions: "Who is founder of Tesla",
      options: ["Steve jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
      questions: "Who is founder of Google",
      options: ["Steve jobs", "Larry Page", "Bill Gates", "Elon Musk"],
      answerIndex: 1,
    ),
  ];

  void incQue() {
    setState(() {
      allQuestions[questionIndex++];
    });
  }

  Scaffold isQuestionScreen() {
    if (questionScreen = true) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: const Text("Quiz App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.orange,
                ))),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Questions: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),

                //Questions
                Text("${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: 300,
                height: 50,
                child: Text(
                  allQuestions[questionIndex]["questions"],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("A. ${allQuestions[questionIndex]["options"][0]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ))),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("B. ${allQuestions[questionIndex]["options"][1]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ))),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("C. ${allQuestions[questionIndex]["options"][2]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ))),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 180,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text("D. ${allQuestions[questionIndex]["options"][3]}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ))),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: incQue,
            child: const Icon(Icons.forward, color: Colors.orange)),
      );
    }

    //Congralutaions Scaffold
    else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}

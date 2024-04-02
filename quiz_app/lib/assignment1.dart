import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});
  @override
  State createState() => _Assignment1();
}

class Singlequestionformat {
  final String? questions;
  final List<String>? options;
  final int? answer;

  const Singlequestionformat({this.questions, this.options, this.answer});
}

class _Assignment1 extends State {
  bool questionPage = true;
  int questionNo = 0;
  int score = 0;
  int ansno = -1;

  void checkpageisvalide(){
    if(ansno ==-1){
      return;
    }
    if(ansno == questions[questionNo].answer){
      score++;
    }
    if (ansno != -1){
      if(questionNo == questions.length -1){
        questionPage = false;
        setState(() {
        }
        );
        setState(() {
          ansno =-1;
          questionNo++;
        });
      }
    }
  }

  MaterialStateProperty<Color?> isanswercorrect(int selectedindex) {
    if (ansno != -1) {
      if (selectedindex == questions[questionNo].answer) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedindex == ansno) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  List questions = [
    const Singlequestionformat(
        questions: "Who is founder of Google?",
        options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
        answer: 3),
    const Singlequestionformat(
        questions: "Who is founder of Microsoft?",
        options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
        answer: 0),
    const Singlequestionformat(
        questions: "Who is founder of Apple?",
        options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
        answer: 1),
    const Singlequestionformat(
        questions: "Who is founder of Amazon?",
        options: ["Bill Gates", "Jeff Bezos", "Elon Mask", "Lary Page"],
        answer: 1),
    const Singlequestionformat(
        questions: "Who is founder of Tesla?",
        options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
        answer: 2),
  ];

  Scaffold isQuestionScreen() {
    //This Scaffold is for Quiz Questions
    if (questionPage == true) {
      return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.purple,
              title: const Text("Quiz App",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ))),
          body: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 110,
                  ),
                  const Text("Questions: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      )),
                  Text(
                    "${questionNo + 1}/${questions.length}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 70),
                  width: double.infinity,
                  height: 50,
                  child: Text(
                    questions[questionNo].questions,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (ansno == -1) {
                      setState(() {
                        ansno = 0;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(0)),
                  child: Text(
                    "A.${questions[questionNo].options[0]}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (ansno == -1) {
                      setState(() {
                        ansno = 1;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(1)),
                  child: Text(
                    "B.${questions[questionNo].options[1]}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      if (ansno == -1) {
                        setState(() {
                          ansno = 1;
                        });
                      }
                    },
                    style: ButtonStyle(backgroundColor: isanswercorrect(2)),
                    child: Text("C.${questions[questionNo].options[2]}",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ))),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      if (ansno == -1) {
                        setState(() {
                          ansno = 1;
                        });
                      }
                    },
                    style:ButtonStyle(backgroundColor: isanswercorrect(3)),
                    child: Text("D.${questions[questionNo].options[3]}",
                    style:const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))),
              )
            ],
          ),

          floatingActionButton: FloatingActionButton(onPressed:checkpageisvalide,
          backgroundColor: Colors.purpleAccent,
          splashColor :Colors.purple,
          child:const Icon(
            Icons.forward,
            color: Colors.white,
            ),
            ),
          );
    }
    //This Scaffold is for Congratulations Page and reset
    else {
      return Scaffold();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}

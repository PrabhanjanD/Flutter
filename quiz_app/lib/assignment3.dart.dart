import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizApp();
}

class Singlequestionformat {
  final String? questions;
  final List<String>? options;
  final int? answer;

  const Singlequestionformat({this.questions, this.answer, this.options});
}

class _QuizApp extends State {
  bool questionPage = true;
  int questionNo = 0;
  int ansNo = -1;
  int score = 0;

  MaterialStateProperty<Color?> isanswercorrect(int selectedindex) {
    if (ansNo != -1) {
      if (selectedindex == questions[questionNo].answer) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedindex == ansNo) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void checkpageisvalide() {
    if (ansNo == -1) {
      return;
    }
    if (ansNo == questions[questionNo].answer) {
      score++;
    }
    if (ansNo != -1) {
      if (questionNo == questions.length - 1) {
        questionPage = false;
        setState(() {});
      }
      setState(() {
        ansNo = -1;
        questionNo++;
      });
    }
  }

  List questions = [
    const Singlequestionformat(
      questions: "Who is founder of Google?",
      options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
      answer: 3
    ),
     const Singlequestionformat(
      questions: "Who is founder of Microsoft?",
      options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
      answer: 0
     ),
     const Singlequestionformat(
      questions: "Who is founder of Apple?",
      options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
      answer: 1
     ),
     const Singlequestionformat(
      questions: "Who is founder of Amazon?",
      options: ["Bill Gates", "Jeff Bezos", "Elon Mask", "Lary Page"],
      answer: 1
     ),
     const Singlequestionformat(
      questions: "Who is founder of Tesla?",
      options: ["Bill Gates", "Steve Jobs", "Elon Mask", "Lary Page"],
      answer: 2
     ),
  ];

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 380,
              height: 50,
              child: Text(
                questions[questionNo].questions,
                  style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                )
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
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 0;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(0)),
                  child: Text("A.${questions[questionNo].options[0]}",
                      style: const TextStyle(
                        fontSize: 23,
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
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 1;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(1)),
                  child: Text("B.${questions[questionNo].options[1]}",
                      style: const TextStyle(
                        fontSize: 23,
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
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 2;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(2)),
                  child: Text("C.${questions[questionNo].options[2]}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 30,
                width: 300,
                child: 
                    ElevatedButton(
                        onPressed: () {
                          if (ansNo == -1) {
                            setState(() {
                              ansNo = 3;
                            });
                          }
                        },
                        style: ButtonStyle(backgroundColor: isanswercorrect(3)),
                        child: Text("D.${questions[questionNo].options[3]}",
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w400,
                            ))),
                  // (ansNo==questions[questionNo].answer)?
                  // const Icon(Icons.done,color: Colors.green,):const SizedBox()
                ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: checkpageisvalide,
          backgroundColor: Colors.purpleAccent,
          splashColor: Colors.purple,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKUqjfeV1VizTgbs3deEfsWLihHufy1_VjLA&usqp=CAU",
                  height: 150,
                  width: 250,
                ),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3zlXC3yOOD9du2iA86MCrukZwuVSrLO6yqg&usqp=CAU",
                  height: 200,
                ),
                const Text(
                  "You Are Successfully Completed The Quiz",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "You Score: $score/${questions.length}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ansNo = -1;
                        questionNo = 0;
                        questionPage = true;
                        score = 0;
                      });
                    },
                    child: const Text("RESET"))
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}

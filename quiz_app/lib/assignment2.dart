import 'package:flutter/material.dart';

class assignment2 extends StatefulWidget {
  const assignment2({super.key});

  @override
  State createState() => _assignment2State();
}

class SingleQuestionModel {
  final String? questions;
  final List<String>? options;
  final int? ansIndex;

  const SingleQuestionModel({this.questions, this.options, this.ansIndex});
}

class _assignment2State extends State {
  List allQuestions = [
    const SingleQuestionModel(
      questions: "Who is the founder of Microsoft?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      ansIndex: 2,
    ),
    const SingleQuestionModel(
      questions: "Who is the founder of Apple?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      ansIndex: 0,
    ),
    const SingleQuestionModel(
      questions: "Who is the founder of Amazon?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      ansIndex: 1,
    ),
    const SingleQuestionModel(
      questions: "Who is the founder of Tesla?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      ansIndex: 3,
    ),
    const SingleQuestionModel(
      questions: "Who is the founder of Google?",
      options: ["Steve Jobs", "lary Page", "Bill Gates", "Elon Musk"],
      ansIndex: 1,
    )
  ];

  bool correctColor1 = false;
  bool correctColor2 = false;
  bool correctColor3 = false;
  bool correctColor4 = false;

  bool falseColor1 = false;
  bool falseColor2 = false;
  bool falseColor3 = false;
  bool falseColor4 = false;

  bool isquestionScreen = true;
  int questionIndex = 0;

  int count = 0;
  int pressedOption = -1;
  int score = 0;

  void increQue() {
    setState(() {
      allQuestions[questionIndex++];
      correctColor1 = false;
      correctColor2 = false;
      correctColor3 = false;
      correctColor4 = false;

      falseColor1 = false;
      falseColor2 = false;
      falseColor3 = false;
      falseColor4 = false;
      if (questionIndex > allQuestions.length - 1) {
        isquestionScreen = false;
      }
      count = 0;
      pressedOption = -1;
    });
  }

  Scaffold isQuestionScreen() {
    if (isquestionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
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
                  "${questionIndex + 1}/${allQuestions.length}",
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
            SizedBox(
              width: 380,
              height: 50,
              child: Text(
                allQuestions[questionIndex].questions,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 500,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressedOption = 0;
                    if (count == 0 &&
                        pressedOption ==
                            allQuestions[questionIndex].ansIndex) {
                      correctColor1 = true;
                      count++;
                      score++;
                    } else if (count == 0 &&
                        pressedOption !=
                            allQuestions[questionIndex].ansIndex) {
                      falseColor1 = true;
                      pressedOption = allQuestions[questionIndex].ansIndex;
                      if (pressedOption ==
                          allQuestions[questionIndex].ansIndex) {
                        if (pressedOption == 0) {
                          correctColor1 = true;
                        } else if (pressedOption == 1) {
                          correctColor2 = true;
                        } else if (pressedOption == 2) {
                          correctColor3 = true;
                        } else if (pressedOption == 3) {
                          correctColor4 = true;
                        }
                      }
                      count++;
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (correctColor1 == true) {
                      return correctColor1 ? Colors.green : Colors.white;
                    } else if (falseColor1 == true) {
                      return Colors.red;
                    } else {
                      return Colors.white;
                    }
                  }),
                ),
                child: Text(
                  "A.${allQuestions[questionIndex].options[0]}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 500,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressedOption = 1;

                    if (count == 0 &&
                        pressedOption ==
                            allQuestions[questionIndex].ansIndex) {
                      correctColor2 = true;
                      count++;
                      score++;
                    } else if (count == 0 &&
                        pressedOption !=
                            allQuestions[questionIndex].ansIndex) {
                      falseColor2 = true;
                      pressedOption = allQuestions[questionIndex].ansIndex;

                      if (pressedOption ==
                          allQuestions[questionIndex].ansIndex) {
                        if (pressedOption == 0) {
                          correctColor1 = true;
                        } else if (pressedOption == 1) {
                          correctColor2 = true;
                        } else if (pressedOption == 2) {
                          correctColor3 = true;
                        } else if (pressedOption == 3) {
                          correctColor4 = true;
                        }
                      }
                      count++;
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (correctColor2 == true) {
                      return correctColor2 ? Colors.green : Colors.white;
                    } else if (falseColor2 == true) {
                      return Colors.red;
                    } else {
                      return Colors.white;
                    }
                  }),
                ),
                child: Text(
                  "B.${allQuestions[questionIndex].options[1]}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 500,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressedOption = 2;

                    if (count == 0 &&
                        pressedOption ==
                            allQuestions[questionIndex].ansIndex) {
                      correctColor3 = true;
                      count++;
                      score++;
                    } else if (count == 0 &&
                        pressedOption !=
                            allQuestions[questionIndex].ansIndex) {
                      falseColor3 = true;
                      pressedOption = allQuestions[questionIndex].ansIndex;

                      if (pressedOption ==
                          allQuestions[questionIndex].ansIndex) {
                        if (pressedOption == 0) {
                          correctColor1 = true;
                        } else if (pressedOption == 1) {
                          correctColor2 = true;
                        } else if (pressedOption == 2) {
                          correctColor3 = true;
                        } else if (pressedOption == 3) {
                          correctColor4 = true;
                        }
                      }
                      count++;
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (correctColor3 == true) {
                      return correctColor3 ? Colors.green : Colors.white;
                    } else if (falseColor3 == true) {
                      return Colors.red;
                    } else {
                      return Colors.white;
                    }
                  }),
                ),
                child: Text(
                  "C.${allQuestions[questionIndex].options[2]}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 500,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    pressedOption = 3;

                    if (count == 0 &&
                        pressedOption ==
                            allQuestions[questionIndex].ansIndex) {
                      correctColor4 = true;
                      count++;
                      score++;
                    } else if (count == 0 &&
                        pressedOption ==
                            allQuestions[questionIndex].ansIndex) {
                      falseColor4 = true;
                      pressedOption = allQuestions[questionIndex].ansIndex;

                      if (pressedOption ==
                          allQuestions[questionIndex].ansIndex) {
                        if (pressedOption == 0) {
                          correctColor1 = true;
                        } else if (pressedOption == 1) {
                          correctColor2 = true;
                        } else if (pressedOption == 2) {
                          correctColor3 = true;
                        } else if (pressedOption == 3) {
                          correctColor4 = true;
                        }
                      }
                      count++;
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (correctColor4 == true) {
                      return correctColor4 ? Colors.green : Colors.white;
                    } else if (falseColor4 == true) {
                      return Colors.red;
                    } else {
                      return Colors.white;
                    }
                  }),
                ),
                child: Text(
                  "D.${allQuestions[questionIndex].options[3]}",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (pressedOption == -1) {
                return;
              } else {
                increQue();
              }
            });
          },
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Image.network(
                    "https://static.vecteezy.com/system/resources/previews/002/795/986/non_2x/gold-cup-winner-congratulations-background-illustration-free-vector.jpg")),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              child: Text(
                "You have completed the quiz!!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Text(
                "Score:$score/" "${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      questionIndex = 0;
                      questionIndex = 0;
                      pressedOption = -1;
                      isquestionScreen = true;
                      score = 0;
                      count = 0;
                    });
                  },
                  child: const Text(
                    "Refresh",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Program3 extends StatelessWidget {
  const Program3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Program7(),
        ),
      ),
    );
  }
}

class Program7 extends StatefulWidget {
  const Program7({
    super.key,
  });

  @override
  State createState() => _Program7State();
}

class _Program7State extends State<Program7> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Container(
          height: 400,
          width: 400,
          color: Color.fromARGB(255, 251, 250, 250),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                Image.network(
                  "https://www.vhv.rs/dpng/f/509-5096993_login-icon-vector-png-clipart-png-download-user.png",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefix: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _emailController.text = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                      labelText: 'Enter Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefix: Icon(Icons.lock),
                      suffix: Icon(Icons.remove_red_eye_outlined)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _passwordController.text = value!;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      bool isLoggedIn =
                          _emailController.text == "prabhanjan09@gmail.com" &&
                              _passwordController.text == "pass";

                      if (isLoggedIn) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login successful'),
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Program2(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login failed'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Program2 extends StatefulWidget {
  const Program2({super.key});

  @override
  State createState() => _Program1State();
}

class Task {
  String title;
  String description;
  String? date;

  Task({required this.title, required this.description, this.date});
}

List cardColorList = [
  const Color.fromRGBO(250, 232, 232, 1),
  const Color.fromRGBO(232, 237, 250, 1),
  const Color.fromRGBO(250, 249, 232, 1),
  const Color.fromRGBO(250, 232, 250, 1),
  const Color.fromRGBO(250, 232, 232, 1),
];

List tasks = [];

class _Program1State extends State {
  final TextEditingController _title = TextEditingController();

  final TextEditingController _description = TextEditingController();
  final TextEditingController _date = TextEditingController();

  TextEditingController defaultdate = TextEditingController();
  TextEditingController defaulttitle = TextEditingController();
  TextEditingController defaultDiscription = TextEditingController();

  void edit(int index) {
    defaulttitle.text = tasks[index].title;
    defaultdate.text = tasks[index].date;
    defaultDiscription.text = tasks[index].description;
  }

  void editTask(title, descrip, date, index) {
    tasks[index].title = title;
    tasks[index].description = descrip;
    tasks[index].date = date;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const  Color.fromRGBO(111, 81, 255, 1),
      body: Container(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            const Row(children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                "Good Morning",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ]),
            const Row(children: [
              Padding(padding: EdgeInsets.only(left: 20)),
              Text(
                "Prabhanjan",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(217, 196, 197, 197),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "CREATE TO DO LIST ",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SizedBox(
                        //height: 250,
                        child: Container(
                          height: 720,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40)),
                              color: Color.fromARGB(255, 213, 215, 218)),
                          child: SizedBox(
                            height: 20,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(217, 249, 249, 245),
                              ),
                              child: ListView.builder(
                                  itemCount: tasks.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            // boxShadow: const [
                                            //   BoxShadow(
                                            //     color: Color.fromARGB(
                                            //         255, 224, 45, 114),
                                            //     offset: Offset(10, 10),
                                            //     blurRadius: 10,
                                            //   )
                                            // ],
                                            color: cardColorList[
                                                index % cardColorList.length],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: const EdgeInsets.only(top: 15),
                                        height: 149,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                  ),
                                                  child: Container(
                                                    height: 55,
                                                    width: 55,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      color: Colors.white,
                                                    ),
                                                    child:
                                                        const Icon(Icons.image),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Expanded(
                                                    child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 40,
                                                      child: Text(
                                                        tasks[index].title,
                                                        style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    SizedBox(
                                                      height: 40,
                                                      child: Text(
                                                        tasks[index]
                                                            .description,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  if (tasks[index].date != null)
                                                    Text(
                                                        'Date: ${tasks[index].date}'),
                                                  const Spacer(),
                                                  IconButton(
                                                      onPressed: () {
                                                        _editTask(index);
                                                        edit(index);
                                                        showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            isDismissible: true,
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: 10,
                                                                      right: 10,
                                                                      bottom: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets
                                                                          .bottom),
                                                                  child: Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        const SizedBox(
                                                                          child:
                                                                              Text(
                                                                            "create task",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 30,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        TextField(
                                                                          controller:
                                                                              defaulttitle,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            hintText:
                                                                                "Edit Title",
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        TextField(
                                                                          controller:
                                                                              defaultDiscription,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            hintText:
                                                                                "Edit Description",
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        TextField(
                                                                            controller:
                                                                                defaultdate,
                                                                            decoration:
                                                                                const InputDecoration(
                                                                              hintText: "Edit Date ",
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                              ),
                                                                            ),
                                                                            onTap:
                                                                                () async {
                                                                              DateTime? pickedDate = await showDatePicker(
                                                                                context: context,
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime(2000),
                                                                                lastDate: DateTime(2025),
                                                                              );

                                                                              // ignore: unused_local_variable
                                                                              String editedDate = DateFormat.yMMMd().format(pickedDate!);

                                                                              setState(() {
                                                                                defaultdate.text = editedDate;
                                                                              });
                                                                            }),
                                                                        ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              String title = defaulttitle.text;
                                                                              String descrip = defaultDiscription.text;
                                                                              String date = defaultdate.text;
                                                                              editTask(title, descrip, date, index);
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "Submit",
                                                                              style: TextStyle(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: 25,
                                                                              ),
                                                                            )),
                                                                      ]));
                                                            });
                                                      },
                                                      icon: const Icon(
                                                          Icons.edit)),
                                                  IconButton(
                                                      onPressed: () {
                                                        _deleteTask(index);
                                                      },
                                                      icon: const Icon(
                                                          Icons.delete))
                                                ],
                                              ),
                                            )
                                          ],
                                        ));
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            builder: (BuildContext context) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        child: Text(
                          "create task",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _title,
                        decoration: const InputDecoration(
                          hintText: "Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _description,
                        decoration: const InputDecoration(
                          hintText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: _date,
                        decoration: const InputDecoration(
                          hintText: "Date ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025),
                          );
                          String formatdate =
                              DateFormat.yMMMd().format(pickedDate!);
                          setState(() {
                            _date.text = formatdate;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            String title = _title.text.trim();
                            String descri = _description.text.trim();
                            String date = _date.text.trim();

                            Task newTask = Task(
                                title: title, description: descri, date: date);
                            if (title.isNotEmpty &&
                                descri.isNotEmpty & date.isNotEmpty) {
                              tasks.add(newTask);
                            }

                            _date.clear();
                            _title.clear();
                            _description.clear();

                            Navigator.pop(context);

                            setState(() {});
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          )),
                    ],
                  ));
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _editTask(int index) {
    // ignore: avoid_print
    print('Editing task at index $index');
  }

  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    // ignore: avoid_print
    print('Deleting task at index $index');
}
}
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Direct(),
  ));
}

class Direct extends StatefulWidget {
  const Direct({Key? key}) : super(key: key);

  @override
  _DirectState createState() => _DirectState();
}

class _DirectState extends State<Direct> {
  String output = '';//psuedo output, we keep this in memory and later assign it as num1, num2, or as decimal value.
  String userInput = '';
  String history = '';


  one(BuildContext context, String value) {
    print(value);
    if (value == 'AC') {
      setState(() {
        userInput = '';
        output = '';
      });
    } else if (value == '+' ||
        value == '-' ||
        value == 'x' ||
        value == '/' ||
        value == '%') {
      setState(() {
        userInput+=value;
      });
    } else if (value == '.') {
      if (userInput.contains('.')) {
        print(
            "already contains a decimal"); // if the number already contains a decimal, we print this.
      } else {
        setState(() {
          userInput+=value;
        }); //we are adding a decimal point to the number we have at hand
      }
    } else if (value == "=") {
      String _uInput = userInput;
      _uInput=_uInput.replaceAll('x', '*');
      Parser p = Parser();
      Expression ep = p.parse(_uInput);
      ContextModel cm = ContextModel();
      double eval = ep.evaluate(EvaluationType.REAL, cm);
      setState(() {
        output=eval.toString();
        print(output);
      });
    } else {
      setState(() {
        userInput+=value;
      });
      print(userInput);
    }

//recording history of the operations done
    if (value != 'AC') {
      history = history +
          value; // as long as buttonValue is not 'AC', keep displaying them.
    }
    else {
      history = ''; // if 'AC' is pressed, then delete the history.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      body:Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding:const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    history,
                    style:const TextStyle(
                        color:Colors.black,
                        fontSize: 12
                    ),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style:const TextStyle(
                        color:Colors.black,
                        fontSize: 18
                    ),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    output,
                    style:const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 45,
                bottom: 50
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "AC");
                      },
                      child: const Text("AC",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "+");
                      },
                      child: const Text("+",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "-");
                      },
                      child: const Text("-",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "x");
                      },
                      child: const Text("x",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 120,
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "1");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text(
                        "1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "2");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("2",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "3");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("3",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "%");
                      },
                      child: const Text("%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 40,
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "4");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("4",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "5");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("5",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "6");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("6",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "/");
                      },
                      child: const Text("/",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 120,
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "7");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("7",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "8");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("8",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "9");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("9",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "=");
                      },
                      child: const Text("=",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 105,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, "0");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                      ),
                      child: const Text("0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        one(context, ".");
                      },
                      child: const Text(".",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
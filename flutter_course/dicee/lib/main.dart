import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void diceChange() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Dice'),
          ),
          body: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      diceChange();
                    },
                    child: Image.asset('images/dice$leftDiceNum.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      diceChange();
                    },
                    child: Image.asset('images/dice$rightDiceNum.png'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

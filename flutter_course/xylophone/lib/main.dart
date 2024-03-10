import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildkey({required int soundNumber, required Color color}) =>
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const ContinuousRectangleBorder(),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Container(),
        ),
      );

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildkey(soundNumber: 1, color: Colors.red),
              buildkey(soundNumber: 2, color: Colors.orange),
              buildkey(soundNumber: 3, color: Colors.yellow),
              buildkey(soundNumber: 4, color: Colors.green),
              buildkey(soundNumber: 5, color: Colors.teal),
              buildkey(soundNumber: 6, color: Colors.blue),
              buildkey(soundNumber: 7, color: Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}

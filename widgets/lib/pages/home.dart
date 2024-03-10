import 'package:flutter/material.dart';
import 'package:widgets/components/my_button.dart';
import 'package:widgets/pages/slidable_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // welcome back you've been missed!
              Text(
                'Different Widgets',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 20),

              MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/slidable_widget');
                  },
                text: "Slidable Widget",
              ),

              const SizedBox(height: 20),

              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/curved_navigation_bar');
                },
                text: "Curved Navigation Bar",
              ),

              const SizedBox(height: 20),

              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/light_dark');
                },
                text: "LIGHT ☀️🌘 DARK mode",
              ),
              const SizedBox(height: 20),

              MyButton(
                onTap: () {
                  Navigator.pushNamed(context, '/riverpod');
                },
                text: "Riverpod Example",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:auth/components/my_button.dart';
import 'package:auth/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  //invalid credential message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
        onPressed: () {},
        label: 'DISMISS',
      ),
    ));
  }

  Future passwordReset() async {
    print(_emailController.text.trim());
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showErrorMessage("Password reset link sent to email");
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[200],
          elevation: 0,
        ),
        body: Column(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // email textfield
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),

                const SizedBox(height: 10),

                //sign in button
                MyButton(
                  onTap: () {},
                  text: 'Sign In ',
                ),

                const SizedBox(height: 25),

                MaterialButton(
                  onPressed: passwordReset,
                  child: Text("Reset Password"),
                  color: Colors.deepPurple,
                ),
              ],
            ),
          ),
        ]));
  }
}

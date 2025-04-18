import 'package:flutter/material.dart';
import 'package:hw4/components/my_button.dart';
import 'package:hw4/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 50),
            Text(
              "Welcome to Chat App!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 25),
            MyButton(
              text: "Login",
              onTap: login,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Need an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
                Text(" Sign Up",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

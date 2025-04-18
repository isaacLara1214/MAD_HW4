import 'package:flutter/material.dart';
import 'package:hw4/pages/login_page.dart';
import 'package:hw4/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool _isLogin = true;

  void toggleView() {
    setState(() {
      _isLogin = !_isLogin; // Toggle between login and register
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLogin) {
      return LoginPage(
        onTap: toggleView,
      );
    } else {
      return RegisterPage(
        onTap: toggleView,
      );
    }
  }
}

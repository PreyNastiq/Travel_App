import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Pages/LoginPage.dart';
import 'package:travel_destinatio_listing_app/Pages/RegisterPage.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initial login page shown
  bool isLogin = true;

  //changing the login page to register page and vice versa
  void togglePage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(onTap: togglePage);
    } else {
      return RegisterPage(onTap: togglePage);
    }
  }
}

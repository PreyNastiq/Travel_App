import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Auth/Auth.dart';
import 'package:travel_destinatio_listing_app/Components/myButton.dart';
import 'package:travel_destinatio_listing_app/Components/myTextField.dart';
// Removed unused import

class LoginPage extends StatefulWidget {
  final void Function() onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    //get auth service
    final _authService = Auth();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }

    //display error
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }
  //authentication logic here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //login Here
            const Text(
              'Login Here',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            //title
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            //email text field
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscure: false,
            ),

            const SizedBox(height: 10),

            //password text field
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscure: true,
            ),

            const SizedBox(height: 25),

            //login button
            MyButton(
              onTap: () => login(),
              text: 'Log In',
            ),

            const SizedBox(height: 20),

            //Not a member? Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Auth/Auth.dart';
import 'package:travel_destinatio_listing_app/Components/myButton.dart';
import 'package:travel_destinatio_listing_app/Components/myTextField.dart';

class RegisterPage extends StatefulWidget {
  final void Function() onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers for text fields
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  //login method
  void signUp() async {
    //get auth service
    final _authService = Auth();

    //check if password matches to create the user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailPassword(
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

    //if passwords dont matches show errors
    else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Passwords don't match"),
              ));
    }
  }

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
              'Sign Up Here',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            //title
            const Text(
              'Hello There',
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

            const SizedBox(height: 10),

            //confirm password text field
            MyTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscure: true,
            ),

            const SizedBox(height: 25),

            //login button
            MyButton(
              onTap: () => signUp(),
              text: 'Sign Up',
            ),

            const SizedBox(height: 20),

            //Not a member? Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already a member?',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Login Here',
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

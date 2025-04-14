import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_destinatio_listing_app/Auth/LoginOrRegister.dart';
import 'package:travel_destinatio_listing_app/Pages/HomePage.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _showingWelcome = false;
  Timer? _welcomeTimer;

  @override
  void dispose() {
    _welcomeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // While waiting for connection
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // User is signed in
          if (snapshot.hasData) {
            // If welcome screen hasn't been shown yet
            if (!_showingWelcome) {
              _showingWelcome = true;

              // Start timer to go to HomePage
              _welcomeTimer = Timer(const Duration(seconds: 2), () {
                if (mounted) {
                  setState(() {});
                }
              });

              return const WelcomePage();
            }

            // After welcome screen delay
            return const HomePage();
          }

          // User is not signed in
          _showingWelcome = false;
          return const LoginOrRegister();
        },
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Welcome!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

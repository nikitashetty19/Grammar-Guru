import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ipd/pages/homePast.dart';
import 'package:ipd/pages/login_or_register_page.dart';
import 'package:ipd/pages/login_page.dart';
import 'package:ipd/screens/splash_screen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SplashScreen();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

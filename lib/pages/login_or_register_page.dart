import 'package:flutter/material.dart';
import 'package:ipd/pages/login_page.dart';
import 'package:ipd/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  LoginOrRegisterPage({super.key});
  @override
  State<LoginOrRegisterPage> createState() {
    return _LoginOrRegisterPage();
  }
}

class _LoginOrRegisterPage extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void toogglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: toogglePages,
      );
    } else {
      return RegisterPage(onTap: toogglePages);
    }
  }
}

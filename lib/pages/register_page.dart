import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ipd/components/google.dart';
import 'package:ipd/components/my_textfeild.dart';
import 'package:ipd/components/signin_button.dart';
import 'package:ipd/models/user.dart';
import 'package:ipd/repositories/user_repo.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key, required this.onTap});
  void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final UserRepository _userRepository = UserRepository();

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        // Create user in Firebase Authentication
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // If user creation is successful, add user details to Firestore
        if (userCredential.user != null) {
          // Create a new user object
          User user = userCredential.user!;
          Users newUser = Users(
            username: user.email!, // Using email as username
            passwordHash: passwordController.text,
          );

          // Add the user using UserRepository
          await _userRepository.addUser(context, newUser);
          Navigator.pop(context);
        }
      } else {
        Navigator.pop(context);
        showErrorMessage("Passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Incorrect Password"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                //icon
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                //Text
                const Text("Welcome! Lets create an account for you",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 15,
                ),
                //username
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),

                //sign in
                SigninButton(
                  onTap: signUserUp,
                  text: "Sign Up",
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Or Continue With",
                  style:
                      TextStyle(color: const Color.fromARGB(255, 58, 53, 53)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Google(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login now",
                        style: TextStyle(
                            color: Color.fromARGB(255, 35, 132, 211),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

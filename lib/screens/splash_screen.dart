import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipd/constants/constants.dart';
import 'package:ipd/pages/homePast.dart';
import 'package:ipd/pages/homePage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  @override
  State<SplashScreen> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navigateToMainScreen();
      }
    });
  }

  void navigateToMainScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 242, 170, 255),
      body: Center(
        child: SlideTransition(
            position: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/pic.png',
                  height: 150.0,
                  width: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Grammer',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: kTextBlackColor,
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.8),
                    ),
                    Text(
                      'Guru',
                      style: GoogleFonts.pattaya(
                          color: kTextBlackColor,
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 2.8),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

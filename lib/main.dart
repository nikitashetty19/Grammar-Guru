import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipd/constants/constants.dart';
import 'package:ipd/pages/auth_page.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            primaryColor: kPrimaryColor,
            textTheme:
                GoogleFonts.sourceSans3TextTheme(Theme.of(context).textTheme)
                    .apply()
                    .copyWith(
                        bodyMedium:
                            TextStyle(
                                color: kTextWhiteColor,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                        bodySmall: TextStyle(
                            color: kTextWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
            inputDecorationTheme: InputDecorationTheme(
              labelStyle:
                  TextStyle(fontSize: 15, color: kTextLightColor, height: 0.5),
              hintStyle:
                  TextStyle(fontSize: 16, color: kTextBlackColor, height: 0.5),
            )),
        home: AuthPage());
  }
}

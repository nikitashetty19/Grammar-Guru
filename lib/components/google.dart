import 'package:flutter/material.dart';

class Google extends StatelessWidget {
  Google({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      child: Image.asset(
        'lib/images/google-logo-9808.png',
        height: 70,
      ),
    );
  }
}

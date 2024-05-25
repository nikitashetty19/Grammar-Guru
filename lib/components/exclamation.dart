import 'package:flutter/material.dart';

class ExclamationScreen extends StatelessWidget {
  ExclamationScreen({Key? key}) : super(key: key);

  final List<String> punctuationGuide = [
    'An exclamation mark is a punctuation mark that is used to indicate strong emotions, excitement, surprise, or emphasis in a sentence.',
    'Here are some common uses of the exclamation mark with examples:',
    '-> Expressing excitement or enthusiasm:',
    "Example:\n 1) I can't believe I won the lottery!\n2) Wow! This is the best day ever!",
    '-> Adding emphasis:',
    "Example:\n That movie was incredible!",
    '-> Using an Exclamation Mark at the End of an Interjection:',
    'Example:\n1) Wow! That is great news\n2) Alas! That is really bad. What are you going to do about it?',
    '-> Using an Exclamation Mark in Direct Speech:',
    'Example:\n1) What nerve she has to say, “You are rude”!'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exclamation Mark'),
        backgroundColor: Colors.blue, // Customize AppBar background color
      ),
      body: Container(
        color: Colors.white, // Set background color for the entire screen
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: punctuationGuide.map((text) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    if (text.startsWith(
                        'An exclamation mark is a punctuation mark'))
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else if (text.startsWith('Example:'))
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors
                              .yellow, // Background color for example sentences
                        ),
                      )
                    else
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

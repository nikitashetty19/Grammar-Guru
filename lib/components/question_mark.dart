import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final List<String> punctuationGuide = [
    'A Question Mark is a special punctuation mark that we use in sentences when we want to ask a question.',
    'Here are some common uses of the question mark with examples:',
    '-> Asking Questions:',
    "Example:\n1) What's your favorite color?\n2) Did you finish your homework?",
    '-> Tag Questions: Sometimes, we use question marks with little questions at the end of sentences to check if someone agrees with us.',
    'Example:\n 1) You like ice cream, don\'t you?\n2) It\'s a sunny day, isn\'t it?',
    '-> Uncertainty: If we\'re not sure about something, we can use a question mark to show that we\'re not certain.',
    'Example:\n1) I think the party is at 3:00?\n2)Maybe we\'ll go to the park tomorrow?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Mark Guide'),
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
                        'A Question Mark is a special punctuation mark'))
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

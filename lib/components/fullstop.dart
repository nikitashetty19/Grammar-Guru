import 'package:flutter/material.dart';

class FullStopScreen extends StatelessWidget {
  FullStopScreen({Key? key}) : super(key: key);

  final List<String> punctuationGuide = [
    'In sentences, a full stop, also known as a period in American English, is a punctuation mark that is used at the logical end of a sentence.',
    'Here are some common uses of the exclamation mark with examples:',
    '->End of a declarative sentence:',
    "Example:\n 1) She is going to the store.\n2) I love to read.",
    '->End of a command or request:',
    "Example:\n 1) Please pass the salt.\n2) Close the door.",
    '->End of an imperative sentence for emphasis:',
    "Example:\n 1) Stop right there.\n2) Think about it.",
    '->Abbreviating titles:',
    "Example:\n Mr. Johnson went to the meeting.\n2) Prof. Smith is teaching the class."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Stop'),
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
                    if (text.startsWith('In sentences, a full stop,'))
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

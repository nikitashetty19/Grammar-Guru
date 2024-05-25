import 'package:flutter/material.dart';

class CommaScreen extends StatelessWidget {
  CommaScreen({Key? key}) : super(key: key);

  final List<String> punctuationGuide = [
    'A comma is a punctuation mark used in writing to indicate a short pause within a sentence. It serves various functions, such as separating elements in a list, clarifying sentence structure, and setting off nonessential information',
    'Here are some common uses of the comma with examples:',
    '-> Commas are used to separate items in a list when the list includes more than two items:',
    'Example: \n1) I need to buy apples, oranges, bananas, and grapes.\n2) The conference will cover topics such as marketing, finance, and technology.',
    '-> Separating Independent Clauses in a Compound Sentence when coordinating conjunction (such as "and," "but," "or," "nor," "for," "so," or "yet"), you should use a comma before the conjunction:',
    'Example:\n I wanted to go to the movies, but I couldn\'t find a ticket.',
    '-> When you directly address someone in a sentence, use a comma to set off their name:',
    'Example:\n John, please pass me the salt.',
    '-> Commas are used after introductory words, phrases, or clauses that come at the beginning of a sentence to set the stage for the main clause:',
    'Example: \nAfter a long day at work, I went for a relaxing walk in the park.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comma Guide'),
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
                    if (text.startsWith('A comma is a punctuation mark'))
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

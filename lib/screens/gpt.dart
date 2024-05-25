import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ipd/components/chat_widget.dart';
import 'package:ipd/constants/constants.dart';
import 'package:ipd/constants/mesgs.dart';

class Gpt extends StatefulWidget {
  Gpt({super.key});
  @override
  State<Gpt> createState() {
    return _GptState();
  }
}

class _GptState extends State<Gpt> {
  bool isTyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gptBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset('lib/images/1681142503openai-icon-png.png'),
        ),
        title: Text('GPThinker'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return ChatWidget(
                mesg: chatMessages[index]["mesg"].toString(),
                chatIndex:
                    int.parse(chatMessages[index]["chatIndex"].toString()),
              );
            },
          )),
          if (isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            Container(
              color: cardColor,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: kTextWhiteColor),
                    controller: textEditingController,
                    onSubmitted: (value) {},
                    decoration: InputDecoration.collapsed(
                      hintText: "how can i help you",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    color: kTextWhiteColor,
                  )
                ],
              ),
            )
          ]
        ],
      )),
    );
  }
}

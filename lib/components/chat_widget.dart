import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipd/constants/constants.dart';

class ChatWidget extends StatelessWidget {
  ChatWidget({super.key, required this.mesg, required this.chatIndex});
  @override
  final String mesg;
  final int chatIndex;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? gptBackgroundColor : cardColor,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                chatIndex == 0
                    ? Image.asset(
                        'lib/images/PngItem_1114718.png',
                        height: 30,
                        width: 30,
                      )
                    : Image.asset(
                        'lib/images/1681142503openai-icon-png.png',
                        height: 30,
                        width: 30,
                      ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    mesg,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: kTextWhiteColor),
                  ),
                ),
                chatIndex == 0
                    ? SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          )
                        ],
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}

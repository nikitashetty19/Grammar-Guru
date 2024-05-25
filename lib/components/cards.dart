import 'package:flutter/material.dart';
import 'package:ipd/constants/constants.dart';

class Cards extends StatefulWidget {
  Cards(
      {super.key, required this.text, required this.icon, required this.onTap});
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<Cards> createState() {
    return _Cards();
  }
}

class _Cards extends State<Cards> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(kDefaultPadding / 2)),
        child: Column(
          children: [
            Icon(
              widget.icon,
              size: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kTextBlackColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

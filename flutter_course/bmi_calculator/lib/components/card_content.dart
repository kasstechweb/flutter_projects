import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  final Color iconColor;
  final TextStyle textStyle;
  const CardContent(
      {super.key,
      required this.cardIcon,
      required this.iconColor,
      required this.cardText,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
          color: iconColor,
        ),
        const SizedBox(height: 15.0),
        Text(cardText, style: textStyle),
      ],
    );
  }
}

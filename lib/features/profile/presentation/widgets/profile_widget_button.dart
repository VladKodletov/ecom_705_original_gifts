import 'package:flutter/material.dart';

class ProfileWidgetButton extends StatelessWidget {
  const ProfileWidgetButton(
      {super.key, required this.nameButton, required this.onPressed});

  final String nameButton;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        nameButton,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

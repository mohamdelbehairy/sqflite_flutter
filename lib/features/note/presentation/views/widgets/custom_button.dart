import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.buttonName, required this.onTap});
  final String? buttonName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap, child: Text(buttonName ?? "Add Note"));
  }
}
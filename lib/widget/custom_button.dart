import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.teal.shade600,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text(text, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
    );
  }
}


import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const MyButtons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(),
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

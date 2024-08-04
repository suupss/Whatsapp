import 'package:flutter/material.dart';

class InputTextfield extends StatelessWidget {
  final TextEditingController mycontroller;

  const InputTextfield({super.key, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (e) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: mycontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(7),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          prefixIcon: const Icon(Icons.emoji_emotions),
          suffixIcon: const Icon(Icons.attach_file),
          hintText: 'Enter your message'),
    );
  }
}

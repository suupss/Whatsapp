import 'package:flutter/material.dart';
import 'package:work_app/text/view_model/text_viewmodel.dart';

class InputTextfield extends StatefulWidget {
  final TextViewmodel textViewmodel;
  const InputTextfield({super.key, required this.textViewmodel});

  @override
  State<InputTextfield> createState() => _InputTextfieldState();
}

class _InputTextfieldState extends State<InputTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (e) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: widget.textViewmodel.mycontroller,
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

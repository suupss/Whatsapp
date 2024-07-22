import 'package:flutter/material.dart';
import 'package:work_app/text/view_model/text_viewmodel.dart';

class FloatingButton extends StatefulWidget {
  final TextViewmodel textViewmodel;
  const FloatingButton({super.key, required this.textViewmodel});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        widget.textViewmodel.onFloatingPress();
        setState(() {});
      },
      child: const Icon(Icons.send),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:work_app/text/model/text_model.dart';

class TextViewmodel {
  final TextEditingController mycontroller = TextEditingController();
  void onFloatingPress() {
    if (mycontroller.text.isNotEmpty) {
      chat.add(ChatTexts(mycontroller.text, false));
    }

    mycontroller.clear();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/text/view_model/text_viewmodel.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});
  @override
  Widget build(BuildContext context) {
    print('Build');
    final provider = Provider.of<TextViewmodel>(context, listen: false);
    return FloatingActionButton(
      onPressed: () {
        print('I am building');
        provider.onFloatingPress();
      },
      child: const Icon(Icons.send),
    );
  }
}

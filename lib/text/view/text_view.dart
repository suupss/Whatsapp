import 'package:flutter/material.dart';
import 'package:work_app/text/view/text_container.dart';
import '../model/text_model.dart';
import 'package:work_app/text/view_model/text_viewmodel.dart';

class TextView extends StatefulWidget {
  const TextView({super.key});

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  final TextViewmodel textViewmodel = TextViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 207, 207),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: chat.length,
                itemBuilder: (context, index) {
                  return TextContainer(
                      text: chat[index].text, isSent: chat[index].isSent);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.only(right: 60),
              child: TextField(
                onTapOutside: (e) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                controller: textViewmodel.mycontroller,
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
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textViewmodel.onFloatingPress();
          setState(() {});
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}

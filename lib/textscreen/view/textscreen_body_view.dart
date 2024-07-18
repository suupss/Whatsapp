import 'package:flutter/material.dart';
import 'package:work_app/textscreen/view/textscreen_message_view.dart';
import '../model/textscreen.dart';

class TextscreenBodyView extends StatefulWidget {
  const TextscreenBodyView({super.key});

  @override
  State<TextscreenBodyView> createState() => _TextscreenBodyViewState();
}

class _TextscreenBodyViewState extends State<TextscreenBodyView> {
  final TextEditingController _myController = TextEditingController();

  void onFloatingPress() {
    chat.add(ChatTexts(_myController.text, false));
    setState(() {});
    _myController.clear();
  }

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
                  return ChatScreenComponentsReceived(
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
                controller: _myController,
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
        onPressed: onFloatingPress,
        child: const Icon(Icons.send),
      ),
    );
  }
}

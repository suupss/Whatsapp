import 'package:flutter/material.dart';
import 'package:work_app/components/chat_screen_receiver.dart';

import 'components/chat_texts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _myController = TextEditingController();

  void onFloatingPress() {
    chat.add(ChatTexts(_myController.text, false));
    setState(() {});
    _myController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 206, 205, 205),
        appBar: AppBar(
          leadingWidth: 35,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined),
          ),
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/girl.jpg'),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Adam Louis',
                style: TextStyle(),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.video_call)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: chat.length,
                  itemBuilder: (context, index) => ChatScreenComponentsReceived(
                      text: chat[index].text, isSent: chat[index].isSent)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 300,
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
                      prefixIcon: Icon(Icons.emoji_emotions),
                      suffixIcon: Icon(Icons.attach_file)),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: onFloatingPress,
          child: Icon(Icons.send),
        ),
      ),
    );
  }
}

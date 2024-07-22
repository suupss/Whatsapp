import 'package:flutter/material.dart';
import 'package:work_app/chat/viewmodel/chat_viewmodel.dart';
import 'package:work_app/chat/widgets/chat_futurebuilder.dart';
import 'package:work_app/text/view/text_view.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatView> {
  ChatViewmodel chatViewmodel = ChatViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatFuturebuilder(chatViewmodel: chatViewmodel));
  }
}

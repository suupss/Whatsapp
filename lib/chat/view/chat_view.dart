import 'package:flutter/material.dart';
import 'package:work_app/chat/viewmodel/chat_viewmodel.dart';
import 'package:work_app/chat/widgets/chat_futurebuilder.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});

  final ChatViewmodel chatViewmodel = ChatViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatFuturebuilder());
  }
}

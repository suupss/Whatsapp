import 'package:flutter/material.dart';
import 'package:work_app/chat_screen.dart';
import 'components/user_detail.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          if (index == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          }
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(users[index].image),
            radius: 25,
          ),
          title: Text(
            users[index].title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(users[index].subtitle),
          trailing: Text(
            users[index].tailing,
            style: const TextStyle(
                color: Color.fromARGB(255, 77, 167, 80), fontSize: 14),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:work_app/chat/viewmodel/chat_viewmodel.dart';
import 'package:work_app/text/view/text_body.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatView> {
  ChatViewmodel value = ChatViewmodel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: value.fetchDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TextBody()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!.data![index].avatar.toString()),
                          radius: 25,
                        ),
                        title: Row(children: [
                          Text(
                            snapshot.data!.data![index].firstName.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(snapshot.data!.data![index].lastName.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                        subtitle:
                            Text(snapshot.data!.data![index].email.toString()),
                        trailing: Text(
                          snapshot.data!.data![index].id.toString(),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 77, 167, 80),
                              fontSize: 14),
                        ),
                      ),
                    ));
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }
}

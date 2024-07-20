import 'package:flutter/material.dart';
import 'package:work_app/chat_page/viewmodel/chat_page_view_model.dart';
import 'package:work_app/textscreen/view/textscreen_view.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ApiValue value = ApiValue();

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
                                builder: (context) => ChatScreen()));
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

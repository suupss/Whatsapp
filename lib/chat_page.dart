import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work_app/chat_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Future<UsersDetailApi> fetchDetail() async {
  //   final response =
  //       await http.get(Uri.parse('https://reqres.in/api/users?page=p'));
  //   var data = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     return UsersDetailApi.fromJson(data);
  //   } else {
  //     return UsersDetailApi.fromJson(data);
  //   }
  // }

  Future<Map<String, dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=p'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {}

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data!['data'].length,
              itemBuilder: (context, index) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }

                if (snapshot.hasData) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                    },
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data!['data'][index]['avatar']),
                          radius: 25,
                        ),
                        title: Row(children: [
                          Text(
                            snapshot.data!['data'][index]['first_name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(snapshot.data!['data'][index]['last_name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ]),
                        subtitle: Text(snapshot.data!['data'][0]['first_name']),
                        trailing: Text(
                          snapshot.data!['data'][index]['first_name'],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 77, 167, 80),
                              fontSize: 14),
                        )),
                  );
                } else {
                  return const Text('Loading');
                }
              });
        });
    // return FutureBuilder(
    //     future: fetchDetail(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return ListView.builder(
    //             itemCount: snapshot.data!.data!.length,
    //             itemBuilder: (context, index) => GestureDetector(
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => ChatScreen()));
    //                   },
    //                   child: ListTile(
    //                     leading: CircleAvatar(
    //                       backgroundImage: AssetImage(
    //                           snapshot.data!.data![index].id.toString()),
    //                       radius: 25,
    //                     ),
    //                     title: Row(children: [
    //                       Text(
    //                         snapshot.data!.data![index].firstName.toString(),
    //                         style: const TextStyle(fontWeight: FontWeight.bold),
    //                       ),
    //                       SizedBox(
    //                         width: 5,
    //                       ),
    //                       Text(snapshot.data!.data![index].lastName.toString(),
    //                           style:
    //                               const TextStyle(fontWeight: FontWeight.bold))
    //                     ]),
    //                     subtitle:
    //                         Text(snapshot.data!.data![index].email.toString()),
    //                     trailing: Text(
    //                       snapshot.data!.data![index].id.toString(),
    //                       style: const TextStyle(
    //                           color: Color.fromARGB(255, 77, 167, 80),
    //                           fontSize: 14),
    //                     ),
    //                   ),
    //                 ));
    //       } else {
    //         return Text('Error occured');
    //       }
    //     });
  }
}

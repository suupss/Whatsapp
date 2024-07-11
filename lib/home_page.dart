import 'package:flutter/material.dart';
import 'components/user_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            elevation: 0,
            title: const Text(
              'WhatsApp',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              const Icon(Icons.more_vert),
            ],
            bottom: const TabBar(
                labelColor: Colors.white, //selected tab text color
                unselectedLabelColor: Colors.white, //unselected tab text color
                tabs: [
                  Tab(
                    icon: Icon(Icons.camera_alt_rounded),
                  ),
                  Tab(
                    text: 'CHATS',
                  ),
                  Tab(
                    text: 'STATUS',
                  ),
                  Tab(
                    text: 'CALLS',
                  ),
                ]),
          ),
          body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(users[index].image),
                radius: 25,
              ),
              title: Text(
                users[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(users[index].subtitle),
              trailing: Text(
                users[index].tailing,
                style: TextStyle(
                    color: Color.fromARGB(255, 77, 167, 80), fontSize: 14),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_rounded),
            ),
          ),
        ));
  }
}

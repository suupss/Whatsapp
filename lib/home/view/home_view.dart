import 'package:flutter/material.dart';
import 'package:work_app/chat/view/chat_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
              isScrollable: true,
              labelColor: Colors.white, //selected tab text color
              unselectedLabelColor: Colors.white, //unselected tab text color
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt_outlined),
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
        body: TabBarView(children: [
          Center(child: Text('camera')),
          ChatView(),
          Center(child: Text('status')),
          Center(child: Text('calls')),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_rounded),
          ),
        ),
      ),
    );
  }
}

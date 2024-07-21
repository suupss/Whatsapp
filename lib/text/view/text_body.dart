import 'package:flutter/material.dart';
import 'package:work_app/text/view/text_view.dart';

class TextBody extends StatelessWidget {
  const TextBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leadingWidth: 35,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_outlined),
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
          body: const TextView()),
    );
  }
}

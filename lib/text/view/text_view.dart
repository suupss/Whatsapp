import 'package:flutter/material.dart';
import 'package:work_app/text/model/text_model.dart';
import 'package:work_app/text/view_model/text_viewmodel.dart';
import 'package:work_app/text/widgets/floating_button.dart';
import 'package:work_app/text/widgets/input_textfield.dart';
import 'package:work_app/text/widgets/text_container.dart';

class TextBody extends StatelessWidget {
  TextBody({super.key});
  final TextViewmodel textViewmodel = TextViewmodel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 202, 199, 199),
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: chat.length,
                    itemBuilder: (context, index) {
                      return TextContainer(
                          text: chat[index].text, isSent: chat[index].isSent);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(right: 80, bottom: 20, left: 12),
                child: InputTextfield(textViewmodel: textViewmodel),
              ),
            ],
          ),
          floatingActionButton: FloatingButton(textViewmodel: textViewmodel)),
    );
  }
}

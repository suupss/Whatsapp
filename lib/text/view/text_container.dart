import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  final bool isSent;
  const TextContainer({super.key, required this.text, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: isSent ? Alignment.bottomLeft : Alignment.bottomRight,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: isSent
                    ? const Color.fromARGB(255, 173, 32, 166)
                    : Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    text,
                    style:
                        TextStyle(color: isSent ? Colors.white : Colors.black),
                  )),
            ),
          ),
        )
      ]),
    );
  }
}

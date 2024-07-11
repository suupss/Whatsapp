import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  const MyTextField(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.obscureText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(style: BorderStyle.none));
    return TextFormField(
      onTapOutside: (e) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: Icon(
          icon,
          color: const Color.fromARGB(255, 128, 121, 121),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 128, 121, 121)),
        filled: true,
        fillColor: const Color.fromARGB(255, 242, 195, 248),
        focusedBorder: border,
        enabledBorder: border,
      ),
    );
  }
}

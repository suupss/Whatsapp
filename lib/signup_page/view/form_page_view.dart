import 'package:flutter/material.dart';
import 'package:work_app/ui_kit/my_buttons.dart';
import 'package:work_app/utils/validation_part.dart';
import 'package:work_app/login_page/view/login_page_view.dart';
import '../../ui_kit/text_field.dart';

class MyWidget extends StatefulWidget with InputValidationMixin {
  MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Create your account',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: _usernameController,
                validator: widget.validateUsername,
                icon: Icons.person,
                hintText: 'Username',
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: _emailController,
                validator: widget.validateEmail,
                icon: Icons.email,
                hintText: 'Email',
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: _passwordController,
                validator: widget.validatePassword,
                icon: Icons.password,
                hintText: 'Password',
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: _passwordController,
                validator: widget.confirmPassword,
                icon: Icons.password,
                hintText: 'Confirm Password',
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            MyButtons(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                },
                text: 'Sign up'),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:work_app/login/view_model/login_viewmodel.dart';
import 'package:work_app/ui_kit/my_buttons.dart';
import 'package:work_app/utils/input_validation.dart';
import 'package:work_app/ui_kit/mytext_field.dart';

class LoginForm extends StatefulWidget with InputValidationMixin {
  final LoginViewmodel loginViewmodel;
  const LoginForm({super.key, required this.loginViewmodel});

  @override
  State<LoginForm> createState() => LoginFormViewState();
}

class LoginFormViewState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        MyTextField(
          myController: widget.loginViewmodel.usernamecontroller,
          validator: widget.validateUsername,
          icon: Icons.person,
          obscureText: false,
          hintText: 'Username',
        ),
        const SizedBox(
          height: 12,
        ),
        MyTextField(
            myController: widget.loginViewmodel.passwordcontroller,
            validator: widget.validatePassword,
            icon: Icons.password,
            hintText: 'Password',
            obscureText: true),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: MyButtons(
              text: 'Login',
              onPressed: () {
                widget.loginViewmodel.requestApilogin(
                    widget.loginViewmodel.usernamecontroller.text,
                    widget.loginViewmodel.passwordcontroller.text,
                    context);
              }),
        )
      ]),
    );
  }
}

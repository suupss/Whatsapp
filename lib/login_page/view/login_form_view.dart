import 'package:flutter/material.dart';
import 'package:work_app/login_page/view_model/login_form_viewmodel.dart';
import 'package:work_app/ui_kit/my_buttons.dart';
import 'package:work_app/utils/input_validation.dart';
import 'package:work_app/ui_kit/mytext_field.dart';

class LoginFormView extends StatefulWidget with InputValidationMixin {
  const LoginFormView({super.key});

  @override
  State<LoginFormView> createState() => LoginFormViewState();
}

class LoginFormViewState extends State<LoginFormView> {
  final _formKey = GlobalKey<FormState>();

  LoginFormViewmodel loginFormViewmodel = LoginFormViewmodel();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        MyTextField(
          myController: loginFormViewmodel.usernamecontroller,
          validator: widget.validateUsername,
          icon: Icons.person,
          obscureText: false,
          hintText: 'Username',
        ),
        const SizedBox(
          height: 12,
        ),
        MyTextField(
            myController: loginFormViewmodel.passwordcontroller,
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
                loginFormViewmodel.login(
                    loginFormViewmodel.usernamecontroller.text,
                    loginFormViewmodel.passwordcontroller.text,
                    context);
              }),
        )
      ]),
    );
  }
}

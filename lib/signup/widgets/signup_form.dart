import 'package:flutter/material.dart';
import 'package:work_app/signup/view_model/signup_viewmodel.dart';
import 'package:work_app/ui_kit/my_buttons.dart';
import 'package:work_app/utils/input_validation.dart';
import 'package:work_app/login/view/login_view.dart';
import '../../ui_kit/mytext_field.dart';

class SignupForm extends StatefulWidget with InputValidationMixin {
  final SignupViewmodel signupViewmodel;
  SignupForm({super.key, required this.signupViewmodel});

  @override
  State<SignupForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  SignupViewmodel signupViewmodel = SignupViewmodel();

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
                myController: signupViewmodel.usernamecontroller,
                validator: widget.validateUsername,
                icon: Icons.person,
                hintText: 'Username',
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: signupViewmodel.passwordcontroller,
                validator: widget.validateEmail,
                icon: Icons.email,
                hintText: 'Email',
                obscureText: false),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: signupViewmodel.emailcontroller,
                validator: widget.validatePassword,
                icon: Icons.password,
                hintText: 'Password',
                obscureText: true),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                myController: signupViewmodel.passwordcontroller,
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
                        MaterialPageRoute(builder: (context) => LoginView()));
                  }
                },
                text: 'Sign up'),
          ],
        ));
  }
}

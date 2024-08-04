import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/login/view_model/login_viewmodel.dart';
import 'package:work_app/ui_kit/my_buttons.dart';
import 'package:work_app/utils/input_validation.dart';
import 'package:work_app/ui_kit/mytext_field.dart';

class LoginForm extends StatefulWidget with InputValidationMixin {
  // final LoginViewmodel loginViewmodel;
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => LoginFormViewState();
}

class LoginFormViewState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    final provider = Provider.of<LoginViewmodel>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewmodel())
      ],
      child: Form(
        key: _formKey,
        child: Consumer<LoginViewmodel>(
          builder: (BuildContext context, value, Widget? child) =>
              Column(children: [
            MyTextField(
              myController: value.usernamecontroller,
              validator: widget.validateUsername,
              icon: Icons.person,
              obscureText: false,
              hintText: 'Username',
            ),
            const SizedBox(
              height: 12,
            ),
            MyTextField(
                myController: value.passwordcontroller,
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
                    value.requestApilogin(value.usernamecontroller.text,
                        value.passwordcontroller.text, context);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

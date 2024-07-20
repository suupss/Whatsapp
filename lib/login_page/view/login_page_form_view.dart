import 'package:flutter/material.dart';

import 'package:work_app/login_page/view_model/login_page_view_model.dart';
import 'package:work_app/ui_kit/my_buttons.dart';
import 'package:work_app/utils/validation_part.dart';
import 'package:work_app/home_page/view/home_page_view.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:work_app/ui_kit/text_field.dart';

class LoginPageViewModel extends StatefulWidget with InputValidationMixin {
  const LoginPageViewModel({super.key});

  @override
  State<LoginPageViewModel> createState() => _LoginPageViewModelState();
}

class _LoginPageViewModelState extends State<LoginPageViewModel> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  //void login(String? username, password) async {
  //   try {
  //     var bodyy = {
  //       'username': username,
  //       'password': password,
  //     };
  //     Response response = await http.post(
  //         Uri.parse('https://tbe.thuprai.com/v1/api/login/'),
  //         body: bodyy);
  //     if (mounted) {
  //       if (response.statusCode == 200) {
  //         Navigator.push(
  //             context, MaterialPageRoute(builder: (context) => HomePage()));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text(
  //             'Enter correct details',
  //           ),
  //           backgroundColor: Color.fromARGB(255, 173, 32, 166),
  //         ));
  //       }
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  ApiService apiService = ApiService();
  void getData() async {
    await apiService.login(_usernameController.text, _passwordController.text);
    if (apiService.isTrue) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (_usernameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter your email and password'),
        backgroundColor: Color.fromARGB(255, 173, 32, 166),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter correct details'),
        backgroundColor: Color.fromARGB(255, 173, 32, 166),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        MyTextField(
          myController: _usernameController,
          validator: widget.validateUsername,
          icon: Icons.person,
          obscureText: false,
          hintText: 'Username',
        ),
        const SizedBox(
          height: 12,
        ),
        MyTextField(
            myController: _passwordController,
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
          child: MyButtons(text: 'Login', onPressed: getData),
        )
      ]),
    );
  }
}

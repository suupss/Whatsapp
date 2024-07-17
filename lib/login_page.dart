import 'package:flutter/material.dart';
import 'package:work_app/components/my_buttons.dart';
import 'package:work_app/components/validation_part.dart';
import 'package:work_app/home_page.dart';
import 'package:work_app/sign_up_page.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'components/my_pages.dart';

class LoginPage extends StatefulWidget with InputValidationMixin {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void login(String username, password) async {
    try {
      var bodyy = {
        'username': username,
        'password': password,
      };
      Response response = await http.post(
          Uri.parse('https://tbe.thuprai.com/v1/api/login/'),
          body: bodyy);
      if (mounted) {
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Enter correct details',
            ),
            backgroundColor: Color.fromARGB(255, 173, 32, 166),
          ));
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Text('Welcome Back',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text('Enter your credential to login',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 100,
                  ),
                  MyTextField(
                    myController: _usernameController,
                    validator: widget.validateUsername,
                    icon: Icons.person,
                    obscureText: false,
                    hintText: 'Username',
                  ),
                  const SizedBox(
                    height: 10,
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
                    child: MyButtons(
                      onPressed: () {
                        login(
                            _usernameController.text, _passwordController.text);
                        //login(
                        //   _usernameController.text, _passwordController.text);
                        //  if (_formKey.currentState!.validate()) {
                        //  Navigator.pushReplacement(
                        //     context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomePage()));
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => HomePage()),
                        //       (route) => false);
                      },
                      text: 'Login',
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 173, 32, 166),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?   ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                173,
                                32,
                                166,
                              ),
                              fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:work_app/login_page/view_model/login_page_view_model.dart';
import 'package:work_app/signup_page/view/signup_page_view.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
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
            const LoginPageViewModel(),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
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
          ]),
        ),
      ),
    ));
  }
}

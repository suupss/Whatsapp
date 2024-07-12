import 'package:flutter/material.dart';
import 'package:work_app/components/my_buttons.dart';
import 'package:work_app/components/validation_part.dart';
import 'package:work_app/home_page.dart';
import 'components/my_pages.dart';

class LoginPage extends StatelessWidget with InputValidationMixin {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                Form(
                  key: _formKey,
                  child: MyTextField(
                    validator: validateUsername,
                    icon: Icons.person,
                    obscureText: false,
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    validator: validatePassword,
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
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      }
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
                        Navigator.pushNamed(context, '/signup');
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
    );
  }
}

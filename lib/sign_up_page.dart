import 'package:flutter/material.dart';
import 'package:work_app/components/my_buttons.dart';
import 'package:work_app/components/validation_part.dart';
import 'package:work_app/login_page.dart';

import 'components/my_pages.dart';

class SignUpPage extends StatelessWidget with InputValidationMixin {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Create your account',
                      style: TextStyle(fontSize: 15, height: 2.5),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        validator: validateUsername,
                        icon: Icons.person,
                        hintText: 'Username',
                        obscureText: false),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        validator: validateEmail,
                        icon: Icons.email,
                        hintText: 'Email',
                        obscureText: false),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        validator: validatePassword,
                        icon: Icons.password,
                        hintText: 'Password',
                        obscureText: true),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        validator: confirmPassword,
                        icon: Icons.password,
                        hintText: 'Confirm Password',
                        obscureText: true),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButtons(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          }
                        },
                        text: 'Sign up'),
                    const Text(
                      'Or',
                      style: TextStyle(height: 4.5, fontSize: 15),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 173, 32, 166),
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                              color: Color.fromARGB(255, 173, 32, 166)),
                        ),
                        child: const Text(
                          'Sign In with Google',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?   '),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/login'),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 173, 32, 166),
                                fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

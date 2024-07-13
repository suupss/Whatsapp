import 'package:flutter/material.dart';
import 'package:work_app/components/my_buttons.dart';
import 'package:work_app/components/validation_part.dart';
import 'package:work_app/login_page.dart';

import 'components/my_pages.dart';

class SignUpPage extends StatefulWidget with InputValidationMixin {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
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

import 'package:flutter/material.dart';
import 'package:work_app/login/view_model/login_viewmodel.dart';
import 'package:work_app/login/widgets/login_form.dart';
import 'package:work_app/signup/view/signup_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewmodel loginViewmodel = LoginViewmodel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
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
                  LoginForm(),
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
                                  builder: (context) => SignupView()));
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
            )));
  }
}

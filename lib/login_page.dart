import 'package:flutter/material.dart';
import 'package:work_app/components/my_buttons.dart';
import 'package:work_app/home_page.dart';
import 'components/my_pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                const Text(
                  'Welcome Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
                const Text(
                  'Enter your credential to login',
                  style: TextStyle(height: 0.2, fontSize: 16),
                ),
                const SizedBox(
                  height: 100,
                ),
                MyTextField(
                  validator: (value) {},
                  icon: Icons.person,
                  obscureText: false,
                  hintText: 'Username',
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    validator: (value) {},
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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

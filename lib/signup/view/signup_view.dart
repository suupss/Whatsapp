import 'package:flutter/material.dart';
import 'package:work_app/login/view/login_view.dart';
import 'package:work_app/signup/view_model/signup_viewmodel.dart';
import 'package:work_app/signup/widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SignupViewmodel signupViewmodel = SignupViewmodel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SignupForm(
                        signupViewmodel: signupViewmodel,
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(height: 4.5, fontSize: 15),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
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
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginView()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 173, 32, 166),
                                  fontWeight: FontWeight.w800),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

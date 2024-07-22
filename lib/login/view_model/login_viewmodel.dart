import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:work_app/home/view/home_view.dart';

class LoginViewmodel {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  requestApilogin(String username, password, BuildContext context) async {
    try {
      var bodyy = {
        'username': username,
        'password': password,
      };
      Response response = await http.post(
          Uri.parse('https://tbe.thuprai.com/v1/api/login/'),
          body: bodyy);

      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Enter correct details'),
          backgroundColor: Color.fromARGB(255, 173, 32, 166),
        ));
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

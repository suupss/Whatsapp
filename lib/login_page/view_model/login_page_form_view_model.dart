import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  bool isTrue = false;
  login(String username, password) async {
    try {
      var bodyy = {
        'username': username,
        'password': password,
      };
      Response response = await http.post(
          Uri.parse('https://tbe.thuprai.com/v1/api/login/'),
          body: bodyy);

      if (response.statusCode == 200) {
        isTrue = true;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

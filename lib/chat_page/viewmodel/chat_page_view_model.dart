import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:work_app/chat_page/model/user_detail_model.dart';

class ApiValue {
  Future<UsersDetailApi> fetchDetail() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=p'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      UsersDetailApi model = UsersDetailApi.fromJson(data);
      return model;

      // return UsersDetailApi.fromJson(data);
    } else {
      return UsersDetailApi.fromJson(data);
    }
  }
}

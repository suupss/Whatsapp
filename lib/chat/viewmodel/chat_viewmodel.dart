import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:work_app/chat/model/chat_model.dart';

class ChatViewmodel {
  Future<ChatModel> fetchDetail() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=p'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ChatModel model = ChatModel.fromJson(data);
      return model;

      // return UsersDetailApi.fromJson(data);
    } else {
      return ChatModel.fromJson(data);
    }
  }
}
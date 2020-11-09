import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:randomuser_app/core/model/user.dart';

class RandomUser with ChangeNotifier {
  bool loading = true;
  List<User> userList = [];

  void getUsers() async {
    String url = "https://randomuser.me/api/?results=50";
    final response = await http.get(url);
    final responsedata = json.decode(response.body) as Map<String, dynamic>;
    if (responsedata != null) {
      responsedata.forEach((key, value) {
        if (key == 'results') {
          for (int i = 0; i < 50; i++) {
            User user = new User(
                value[i]['gender'],
                value[i]['name']['title'] +
                    ' ' +
                    value[i]['name']['first'] +
                    ' ' +
                    value[i]['name']['last'],
                value[i]['phone'],
                value[i]['cell'],
                value[i]['picture']['large'],
                value[i]['picture']['medium'],
                value[i]['nat'],
                value[i]['email'],
                value[i]['dob']['age']);
            userList.add(user);
          }
        }
      });
      print(userList.length);
      print(userList[10].photolarge);
    }

    setLoading(false);
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return loading;
  }
}

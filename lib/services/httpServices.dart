// import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:snaplance/models/User.dart';

class HttpServices {
  static String userUrl = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> fetchUsers({query}) async {
    http.Response res = await http.get(userUrl);

    ///res.body se content k andr wo long string aa gyi jo ki ek list h lekin abi b usko dart m use krne k liye decode krna pdega;
    String content = res.body;

    ///yha hm decode b kr rhe aur save b kr rhe ek local List k andr.
    List collection = json.decode(content);
    Iterable<User> _users = collection.map((e) => User.fromjson(e));
    if (query != null && query.isNotEmpty) {
      _users =
          _users.where((element) => element.name.toLowerCase().contains(query));
    }
    return _users.toList();
  }
}

void main() async {
  List result = await HttpServices.fetchUsers();
  print(result);
}

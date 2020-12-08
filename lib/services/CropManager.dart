import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:snaplance/models/User.dart';

import 'httpServices.dart';

class CropManager {
  HttpServices httpServices = new HttpServices();

  Stream<List<User>> get userListView {
    return Stream.fromFuture(HttpServices.fetchUsers());
  }

  Stream<List<User>> filtereduserListView({query}) {
    return Stream.fromFuture(HttpServices.fetchUsers(query: query));
  }
}

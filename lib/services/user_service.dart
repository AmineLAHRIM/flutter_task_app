import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/constant.dart';
import 'package:task_app/models/user.dart';

import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  List<User> items;
  User currentUser;

  Future<List<User>> findAll() async {
    var response = await http.get(Constant.REST_URL + '/user/');

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      items = data.map((e) => User.fromJson(e)).toList();
      return items;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<User> login(User user) async {
    var queryParams;

    if (!user.email.isEmpty && !user.password.isEmpty) {
      queryParams = {
        'email': user.email,
        'password': user.password,
      };
      String url = Constant.REST_URL +
          '/user/login?' +
          Uri(queryParameters: queryParams).query;

      var response = await http.get(url);
      print('login response' + response.statusCode.toString());

      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        User currentUser = User.fromJson(data);
        this.currentUser=currentUser;
        saveUserMemory();

        return currentUser;
      } else {
        throw Exception('No Data Found');
      }
    }else{
      return null;
    }

  }

  Future<void> saveUserMemory() async {
    //set SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', currentUser.id,);
  }

  Future<User> findById(int id) async {
    var response = await http.get(Constant.REST_URL + '/user/' + id.toString());

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      User currentUser = User.fromJson(data);
      print('id==findById currentUser');
      return currentUser;
    } else {
      print('id==findById error');
      throw Exception('No Data Found');
    }
  }

  Future<int> add(User user) async {
    print('user' + user.email + ' ' + user.password);
    var response = await http.post(Constant.REST_URL + '/user/',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()));

    print('user' + response.statusCode.toString());

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      int result = int.parse(data.toString());
      return result;
    } else {
      throw Exception('No Data Found');
    }
  }



  Future<User> update(int id, User user) async {
    var response = await http.put(Constant.REST_URL + '/user/' + id.toString(),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user.toJson()));

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      User newUser = User.fromJson(data);
      return newUser;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<int> deleteById(int id) async {
    var response = await http.delete(
      Constant.REST_URL + '/user/' + id.toString(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      int data = json.decode(response.body);
      return data;
    } else {
      throw Exception('No Data Found');
    }
  }
}

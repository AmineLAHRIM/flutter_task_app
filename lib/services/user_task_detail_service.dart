import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:task_app/constant.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/models/user_task_detail.dart';

import 'package:http/http.dart' as http;

class UserTaskDetailService extends ChangeNotifier {
  List<UserTaskDetail> items;
  UserTaskDetail currentUserTaskDetail;

  Future<List<UserTaskDetail>> findAll() async {
    var response = await http.get(Constant.REST_URL + '/userTaskDetail/');

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      items = data.map((e) => UserTaskDetail.fromJson(e)).toList();
      return items;
    } else {
      throw Exception('No Data Found');
    }
  }


  Future<UserTaskDetail> findById(int id) async {
    var response = await http.get(Constant.REST_URL + '/userTaskDetail/' + id.toString());

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      UserTaskDetail currentUserTaskDetail = UserTaskDetail.fromJson(data);
      print('id==findById currentUserTaskDetail');
      return currentUserTaskDetail;
    } else {
      print('id==findById error');
      throw Exception('No Data Found');
    }
  }

  Future<int> add(UserTaskDetail userTaskDetail) async {
    var response = await http.post(Constant.REST_URL + '/userTaskDetail/',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userTaskDetail.toJson()));

    print('userTaskDetail' + response.statusCode.toString());

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      int result = int.parse(data.toString());
      return result;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<UserTaskDetail> update(int id, UserTaskDetail userTaskDetail) async {
    var response = await http.put(Constant.REST_URL + '/userTaskDetail/' + id.toString(),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userTaskDetail.toJson()));

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      UserTaskDetail newUserTaskDetail = UserTaskDetail.fromJson(data);
      return newUserTaskDetail;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<int> deleteById(int id) async {
    var response = await http.delete(
      Constant.REST_URL + '/userTaskDetail/' + id.toString(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      int data = json.decode(response.body);
      return data;
    } else {
      throw Exception('No Data Found');
    }
  }


  Future<List<User>> findAllByTask_Id(int taskId) async {
    var response = await http.get(Constant.REST_URL + '/userTaskDetail/taskId/'+taskId.toString());

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<User> users = data.map((e) => User.fromJson(e)).toList();
      return users;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<List<Task>> findAllByUser_Id(int userId) async {
    var response = await http.get(Constant.REST_URL + '/userTaskDetail/userId/'+userId.toString());

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Task> tasks = data.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } else {
      throw Exception('No Data Found');
    }
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:task_app/constant.dart';
import 'package:task_app/models/task.dart';

import 'package:http/http.dart' as http;

class TaskService extends ChangeNotifier {
  List<Task> items;
  Task currentTask;

  Future<List<Task>> findAll() async {
    var response = await http.get(Constant.REST_URL + '/task/');

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      items = data.map((e) => Task.fromJson(e)).toList();
      return items;
    } else {
      throw Exception('No Data Found');
    }
  }


  Future<Task> findById(int id) async {
    var response = await http.get(Constant.REST_URL + '/task/' + id.toString());

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      Task currentTask = Task.fromJson(data);
      print('id==findById currentTask');
      return currentTask;
    } else {
      print('id==findById error');
      throw Exception('No Data Found');
    }
  }

  Future<int> add(Task task) async {
    var response = await http.post(Constant.REST_URL + '/task/',
        headers: {'Content-Type': 'application/json'},
        body: json.encode(task.toJson()));

    print('task' + response.statusCode.toString());

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      int result = int.parse(data.toString());
      return result;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<Task> update(int id, Task task) async {
    var response = await http.put(Constant.REST_URL + '/task/' + id.toString(),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(task.toJson()));

    if (response.statusCode == 200) {
      dynamic data = json.decode(response.body);
      Task newTask = Task.fromJson(data);
      return newTask;
    } else {
      throw Exception('No Data Found');
    }
  }

  Future<int> deleteById(int id) async {
    var response = await http.delete(
      Constant.REST_URL + '/task/' + id.toString(),
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

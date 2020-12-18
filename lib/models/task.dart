import 'package:task_app/models/user.dart';
import 'package:task_app/models/user_task_detail.dart';

enum TaskStatus { Task, Doing, Done, Important }

class Task {
  int id;
  String name;
  DateTime date;
  String imageUrl;
  String description;
  TaskStatus taskStatus;
  bool deleted;

  List<UserTaskDetail> userTaskDetail;
  List<User> users;
}

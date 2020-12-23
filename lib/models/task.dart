import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/models/user_task_detail.dart';

part 'task.g.dart';

enum TaskStatus {
  Task,
  Doing,
  Done,
  Important,
}

@JsonSerializable(explicitToJson: true)
class Task {
  int id;
  String name;
  DateTime date;
  String imageUrl;
  String description;
  TaskStatus status;
  bool deleted;

  List<UserTaskDetail> userTaskDetail;
  List<User> users;

  Task(
      {this.id,
      this.name,
      this.date,
      this.imageUrl,
      this.description,
      this.status,
      this.deleted,
      this.userTaskDetail,
      this.users});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

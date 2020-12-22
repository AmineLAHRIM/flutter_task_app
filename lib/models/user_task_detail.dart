import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/user.dart';

part 'user_task_detail.g.dart';


@JsonSerializable(explicitToJson: true)
class UserTaskDetail {
  int id;
  List<User> users;
  List<Task> tasks;


  UserTaskDetail({this.id, this.users, this.tasks});

  factory UserTaskDetail.fromJson(Map<String, dynamic> json) => _$UserTaskDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserTaskDetailToJson(this);
}

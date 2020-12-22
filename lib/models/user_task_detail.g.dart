// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_task_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTaskDetail _$UserTaskDetailFromJson(Map<String, dynamic> json) {
  return UserTaskDetail()
    ..id = json['id'] as int
    ..users = (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..tasks = (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$UserTaskDetailToJson(UserTaskDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'users': instance.users?.map((e) => e?.toJson())?.toList(),
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..imageUrl = json['imageUrl'] as String
    ..description = json['description'] as String
    ..taskStatus = _$enumDecodeNullable(_$TaskStatusEnumMap, json['taskStatus'])
    ..deleted = json['deleted'] as bool
    ..userTaskDetail = (json['userTaskDetail'] as List)
        ?.map((e) => e == null
            ? null
            : UserTaskDetail.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..users = (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'taskStatus': _$TaskStatusEnumMap[instance.taskStatus],
      'deleted': instance.deleted,
      'userTaskDetail':
          instance.userTaskDetail?.map((e) => e?.toJson())?.toList(),
      'users': instance.users?.map((e) => e?.toJson())?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TaskStatusEnumMap = {
  TaskStatus.Task: 'Task',
  TaskStatus.Doing: 'Doing',
  TaskStatus.Done: 'Done',
  TaskStatus.Important: 'Important',
};

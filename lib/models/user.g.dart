// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..imageUrl = json['imageUrl'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String
    ..geoLocalisation = json['geoLocalisation'] as String
    ..deleted = json['deleted'] as bool;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'password': instance.password,
      'geoLocalisation': instance.geoLocalisation,
      'deleted': instance.deleted,
    };


import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User{
   int id;
   String name;
   String imageUrl;
   String email;
   String password;
   String geoLocalisation;
   bool deleted;


   User({this.id, this.name, this.imageUrl, this.email, this.password,
      this.geoLocalisation, this.deleted});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

   Map<String, dynamic> toJson() => _$UserToJson(this);

}
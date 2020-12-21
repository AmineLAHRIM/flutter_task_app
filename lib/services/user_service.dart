import 'package:flutter/cupertino.dart';
import 'package:task_app/models/user.dart';

class UserService extends ChangeNotifier{
  List<User> items;
  User currentUser;

}
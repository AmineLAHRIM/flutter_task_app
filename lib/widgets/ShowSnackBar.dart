import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/style.dart';

class ShowSnackBar  {


  final BuildContext context;
  final String text;
  final Color textColor;
  final Color bgColor;


  ShowSnackBar({@required this.context,this.text="", this.textColor=Colors.white, this.bgColor=AppTheme.primary});

  void show(){
    final snackBar = SnackBar(
      content: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(color: textColor),
      ),
      backgroundColor: bgColor,
    );
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

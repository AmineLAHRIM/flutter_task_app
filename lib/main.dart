import 'package:flutter/material.dart';
import 'package:task_app/login_screen.dart';
import 'package:task_app/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return MaterialApp(
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              home: LoginScreen(),
              routes: {
                LoginScreen.routeName: (ctx) => LoginScreen(),
              },
            );
          },
        );
      },
    );
  }
}

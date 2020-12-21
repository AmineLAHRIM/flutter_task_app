import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_app/login_screen.dart';
import 'package:task_app/size_config.dart';
import 'package:task_app/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // this will prevent change oriontation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
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

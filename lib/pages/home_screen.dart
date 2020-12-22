import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static var routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Wecome to Home',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}

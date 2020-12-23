import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/pages/home_screen.dart';
import 'package:task_app/pages/login_screen.dart';
import 'package:task_app/services/task_service.dart';
import 'package:task_app/services/user_service.dart';
import 'package:task_app/services/user_task_detail_service.dart';
import 'package:task_app/size_config.dart';
import 'package:task_app/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiTrans);
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
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => UserService(),
                ),
                ChangeNotifierProvider(
                  create: (context) => TaskService(),
                ),
                ChangeNotifierProvider(
                  create: (context) => UserTaskDetailService(),
                ),
              ],
              child: MaterialApp(
                theme: AppTheme.lightTheme,
                debugShowCheckedModeBanner: false,
                home: Home(),
                routes: {
                  LoginScreen.routeName: (ctx) => LoginScreen(),
                  HomeScreen.routeName: (ctx) => HomeScreen(),
                },
              ),
            );
          },
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoadingInfo = false;
  bool isInit = false;

  //Widget screen = LoginScreen();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!isInit) {
      verifyAuth();
    }
    isInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return !isLoadingInfo
        ? Container(
            color: Colors.white,
          )
        : LoginScreen();
  }

  Future<void> verifyAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userId')) {
      int userId = prefs.getInt('userId');
      if (userId > 0) {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName, arguments: userId);
      }else{
        setState(() {
          isLoadingInfo = true;
        });
      }
    } else {
      setState(() {
        isLoadingInfo = true;
      });
    }
  }
}

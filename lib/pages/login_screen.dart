import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/models/user.dart';
import 'package:task_app/pages/home_screen.dart';
import 'package:task_app/services/user_service.dart';
import 'package:task_app/size_config.dart';
import 'package:task_app/style.dart';
import 'package:task_app/widgets/ShowSnackBar.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController pageViewController =
      new PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool isLogin = false;
  bool isInit = true;
  UserService userService;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userService = Provider.of<UserService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: AppTheme.primary,
            body: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      transform: GradientRotation(90),
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.gradient1,
                        AppTheme.gradient2,
                      ]),
                ),
                child: Column(
                  children: [
                    Spacer(flex: 8),
                    Expanded(
                        flex: 10,
                        child: Container(
                          child: Text(
                            'W',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        )),
                    Spacer(flex: 2),
                    Expanded(
                        flex: 31,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: SvgPicture.asset(
                              'assets/images/onboarding_img.svg'),
                        )),
                    Spacer(flex: 2),
                    Expanded(
                        flex: 6,
                        child: Container(
                          margin: EdgeInsets.only(left: 24),
                          child: Row(
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Text(
                                      'Sign Up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                              color: isLogin
                                                  ? Colors.white
                                                  : AppTheme.secondaryBg),
                                    ),
                                    Positioned.fill(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          splashColor:
                                              AppTheme.shadow.withOpacity(0.1),
                                          onTap: () {
                                            setState(() {
                                              isLogin = false;
                                              pageViewController.previousPage(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve:
                                                      Curves.linearToEaseOut);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(left: 16),
                                  child: Stack(
                                    children: [
                                      Text(
                                        'Login',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2
                                            .copyWith(
                                                color: isLogin
                                                    ? AppTheme.secondaryBg
                                                    : Colors.white),
                                      ),
                                      Positioned.fill(
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            splashColor: AppTheme.shadow
                                                .withOpacity(0.1),
                                            onTap: () {
                                              setState(() {
                                                isLogin = true;
                                                pageViewController.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    curve:
                                                        Curves.linearToEaseOut);
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    Spacer(flex: 2),
                    Container(
                      height: 250,
                      child: LoginPageView(
                          userService: userService,
                          pageViewController: pageViewController),
                    ),
                    Spacer(flex: 6),
                  ],
                ),
              ),
            ),
          );
  }


}

class LoginPageView extends StatelessWidget {
  LoginPageView({
    Key key,
    @required this.userService,
    @required this.pageViewController,
  }) : super(key: key);

  final UserService userService;
  final PageController pageViewController;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();
  User user;

  void signUp(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ShowSnackBar(
              context: context,
              text: "Please fill the information",
              bgColor: AppTheme.danger)
          .show();

      return;
    }

    user = new User(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    if (user != null) {
      userService.add(user).then((value) {
        String snackBarText;
        print('user value' + value.toString());
        if (value > 0) {
          snackBarText = 'Registerd Succusfully!';
          Navigator.pushNamed(context, HomeScreen.routeName);
        } else {
          snackBarText = 'Email Already Exists!';
        }

        ShowSnackBar(
                context: context,
                text: snackBarText,
                bgColor: value > 0 ? AppTheme.success : AppTheme.danger)
            .show();
      });
    }
  }

  void login(BuildContext context) {
    print('user value loginEmailController' + loginEmailController.text);
    print('user value loginPasswordController' + loginPasswordController.text);
    if (loginEmailController.text.isEmpty ||
        loginPasswordController.text.isEmpty) {
      ShowSnackBar(
              context: context,
              text: 'Please fill the informations',
              bgColor: AppTheme.danger)
          .show();

      return;
    }
    user = new User(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    if (user != null) {
      userService.login(user).then((value) {
        String snackBarText;
        if (value != null) {
          snackBarText = 'Login Succusfully!';
          Navigator.pushReplacementNamed(context, HomeScreen.routeName,
              arguments: value.id);
        } else {
          snackBarText = 'Email Already Exists!';
        }
        ShowSnackBar(
                context: context,
                text: snackBarText,
                bgColor: value != null ? AppTheme.success : AppTheme.danger)
            .show();
      });
    } else {
      print('user value null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: TextField(
                    controller: nameController,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 24, right: 24, top: 8),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: TextField(
                    controller: emailController,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 24, right: 24, top: 8),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: TextField(
                    controller: passwordController,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 24, right: 24, top: 8),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondaryBg,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Stack(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Submit',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.white),
                        )),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashFactory: InkRipple.splashFactory,
                          splashColor: AppTheme.shadow.withOpacity(0.1),
                          onTap: () {
                            signUp(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: TextField(
                    controller: loginEmailController,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 24, right: 24, top: 8),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: TextField(
                    controller: loginPasswordController,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 24, right: 24, top: 8),
              child: Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(0),
                color: AppTheme.secondaryBg,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radius)),
                child: Stack(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Submit',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(color: Colors.white),
                        )),
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashFactory: InkRipple.splashFactory,
                          splashColor: AppTheme.shadow.withOpacity(0.1),
                          onTap: () {
                            login(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

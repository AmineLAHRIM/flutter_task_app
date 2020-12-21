import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/size_config.dart';
import 'package:task_app/style.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PageController pageViewController=new PageController(initialPage: 0,keepPage: true,viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppTheme.systemUiTrans);

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
                    child: SvgPicture.asset('assets/images/onboarding_img.svg'),
                  )),
              Spacer(flex: 2),
              Expanded(
                  flex: 6,
                  child: Container(
                    margin: EdgeInsets.only(left: 24),
                    child: Row(
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                pageViewController.previousPage(
                                    duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                              });

                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageViewController.nextPage(
                                      duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                                });
                              },
                              child: Text(
                                'Sign Up',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(color: AppTheme.secondaryBg),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Spacer(flex: 2),
              Container(
                height: 250,
                child: PageView(
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: TextField(
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: TextField(
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: TextField(
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
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
                                      splashColor:
                                          AppTheme.shadow.withOpacity(0.1),
                                      onTap: () {},
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: TextField(
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16),
                              child: TextField(
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
                                borderRadius:
                                    BorderRadius.circular(AppTheme.radius)),
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
                                      splashColor:
                                          AppTheme.shadow.withOpacity(0.1),
                                      onTap: () => null,
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
                ),
              ),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}

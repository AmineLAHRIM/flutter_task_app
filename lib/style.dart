import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color topBarBackgroundColor = Color(0xFFFFD974);
  static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  static const Color primary = Color(0xFF147BDF);
  static Color secondary = Color(0xFF0763BD).withOpacity(0.5);
  static const Color danger = Color(0xFFFF8484);
  static const Color success = Color(0xFF07E079);
  static const Color warning = Color(0xFFF7B500);
  static const Color info = Color(0xFF0095FF);
  static const List<Color> taskColors = [Color(0xFF53D7FF),Color(0xFFFF66B8),Color(0xFF07E079)];
  static const List<Color> taskStatusColors = [Color(0xFFF5A623),Color(0xFFA880E3),Color(0xFF2DD8CF),Color(0xFFFF8484)];
  static const Color headlineTextColor = Colors.black;
  static const Color subTitleTextColor = Color(0xFF9B9B9B);
  static const Color bg = Color(0xFFFFFFFF);
  static const Color secondaryBg = Color(0xFFFFD053);
  static Color shadow = Color(0xFFBCBCBC).withOpacity(0.3);
  static  Color borderCard = Color(0xFF707070).withOpacity(0.5);
  static const Color fb = Color(0xFF0041A8);
  static const Color twitter = Color(0xFF42AAFF);
  static const Color google = Color(0xFFF2F8FF);
  static const Color footertext = Color(0xFFC5CEE0);
  static const Color gradient1 = Color(0xFF1DA1F3);
  static const Color gradient2 = Color(0xFF4173CC);
  static const double radius = 5.0;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.bg,
    backgroundColor: AppTheme.bg,
    brightness: Brightness.light,
    primaryColor: AppTheme.headlineTextColor,
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: AppTheme.bg,
    textTheme: darkTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    button: _button,
    subtitle1: _subtitle1,
    subtitle2: _subtitle2,
    bodyText1: _bodyText1,
    bodyText2: _bodyText2,
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline1: _headline1.copyWith(color: Colors.white),
    headline2: _headline2.copyWith(color: Colors.white),
    headline3: _headline3.copyWith(color: Colors.white),
    headline4: _headline4.copyWith(color: Colors.white),
    headline5: _headline5.copyWith(color: Colors.white),
    headline6: _headline6.copyWith(color: Colors.white),
    button: _button.copyWith(color: AppTheme.headlineTextColor),
    subtitle1: _subtitle1.copyWith(color: Colors.white),
    subtitle2: _subtitle2.copyWith(color: Colors.white),
    bodyText1: _bodyText1.copyWith(color: AppTheme.primary),
    bodyText2: _bodyText2.copyWith(color: AppTheme.secondaryBg),
  );

  static final TextStyle _headline1 = TextStyle(
    color: Colors.black,
    fontFamily: "Poppins",
    fontSize: 24,
  );
  static final TextStyle _headline2 = TextStyle(
    fontFamily: "Poppins",
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static final TextStyle _headline3 = TextStyle(
    fontFamily: "Poppins",
    color: Colors.black,
    fontSize: 18,
  );
  static final TextStyle _headline4 = TextStyle(
    fontFamily: "Poppins",
    color: AppTheme.subTitleTextColor,
    fontSize: 16,
  );
  static final TextStyle _headline5 = TextStyle(
    fontFamily: "Poppins",
    color: Colors.black,
    fontSize: 14,
  );
  static final TextStyle _headline6 = TextStyle(
    color: AppTheme.subTitleTextColor,
    fontWeight: FontWeight.w600,
    fontFamily: "Lato",
    fontSize: 16,
  );

  static final TextStyle _button = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 18,
  );

  static final TextStyle _subtitle1 = TextStyle(
    color: AppTheme.headlineTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 14,
  );

  static final TextStyle _subtitle2 = TextStyle(
    color: AppTheme.subTitleTextColor,
    fontWeight: FontWeight.w900,
    fontFamily: "Lato",
    fontSize: 14,
  );

  static final TextStyle _bodyText1 = TextStyle(
    color: AppTheme.headlineTextColor,
    fontFamily: "Poppins",
    fontSize: 12,
    letterSpacing: 1,
  );

  static final TextStyle _bodyText2 = TextStyle(
    color: AppTheme.subTitleTextColor,
    fontFamily: "Poppins",
    fontSize: 12,
    letterSpacing: 1,

  );

  static final SystemUiOverlayStyle systemUiDark = SystemUiOverlayStyle(
    systemNavigationBarColor: AppTheme.headlineTextColor,
    statusBarColor: AppTheme.headlineTextColor,
    statusBarIconBrightness: Brightness.light,
  );

  static final SystemUiOverlayStyle systemUiLight = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  );

  static final SystemUiOverlayStyle systemUiTrans = SystemUiOverlayStyle(
    systemNavigationBarColor: AppTheme.primary,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,

  );


}

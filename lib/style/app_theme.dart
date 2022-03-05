import 'package:books_store_app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    primarySwatch: mainColor,
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.white54,
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
        elevation: 0.0,
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent)));

final Map<int, Color> mainColorMap = {
  50: Color(0xFF00695C),
  100: Color(0xFF00695C),
  200: Color(0xFF00695C),
  300: Color(0xFF00695C),
  400: Color(0xFF00695C),
  500: Color(0xFF00695C),
  600: Color(0xFF00695C),
  700: Color(0xFF00695C),
  800: Color(0xFF00695C),
  900: Color(0xFF00695C),
};

final MaterialColor mainColor = MaterialColor(Color(0xFF00695C).value, mainColorMap);

final Color cafeColor = Color(0xFFD9AA63);
final Color primaryColor = Color(0xFF00695C);
// final Color primaryColor = Color(0xFF00695C);
final detailsFontColor = Colors.white;

// TextStyles
TextStyle kProfileDataStyle = TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle kBookNameStyle = TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16);
TextStyle kSignTitleStyle = GoogleFonts.roboto(
  letterSpacing: 1.5,
  color: Colors.white,
  fontSize: 30,
);
TextStyle kWhiteCaption = TextStyle(fontSize: 12.0, color: Colors.white, letterSpacing: 0);
TextStyle kBigTextStyle = TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

// InputBorders //
InputBorder kSignInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defSpacing * .75), borderSide: BorderSide(color: primaryColor));
InputBorder kSecSignInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(defSpacing * .75), borderSide: BorderSide(color: Colors.grey));

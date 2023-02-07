import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'components.dart';

var edge = 64;

//Dimensions Layout
var dimenUltraWide = 1200;
var dimenWide = 850;
var dimenNarrow = 0;

//Colors
const blackColor = Color(0xff000000);
const blackLightColor = Color.fromARGB(255, 57, 58, 59);
const whiteColor = Color(0xffffffff);
const greenColor = Color(0xff046460);
const grayColor = Color(0xffF1F0F0);
const blueColor = Color(0xffB3DBFF);

//Textstyles
TextStyle blackTextStyle = GoogleFonts.openSans(
  fontWeight: FontWeight.w400,
  letterSpacing: 0.7,
  wordSpacing: 0.05,
  color: blackColor,
  fontSize: 14,
);

TextStyle whiteTextStyle = GoogleFonts.openSans(
  fontWeight: FontWeight.w400,
  letterSpacing: 0.7,
  wordSpacing: 0.05,
  color: whiteColor.withOpacity(0.9),
  fontSize: 15,
);

//Themes
var lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: greenColor,
  primarySwatch: generateMaterialColor(color: greenColor),
  textTheme: TextTheme(
    displaySmall: blackTextStyle,
    displayMedium: blackTextStyle,
    displayLarge: blackTextStyle,
  ),
);

var darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: greenColor,
  primarySwatch: generateMaterialColor(color: Color.fromARGB(255, 29, 27, 27)),
  textTheme: TextTheme(
    displaySmall: whiteTextStyle,
    displayMedium: whiteTextStyle,
    displayLarge: whiteTextStyle,
  ),
);

//Appbar only mobile layout
appbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Transform.scale(scale: 0.9, child: ComponentsApp().logoAppLight),
    centerTitle: false,
  );
}

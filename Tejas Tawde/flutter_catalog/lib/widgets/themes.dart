import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.cabin().fontFamily,
      cardColor: Colors.white,
      canvasColor: MyTheme.cream,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black), toolbarTextStyle: Theme.of(context).textTheme.bodyText2, titleTextStyle: Theme.of(context).textTheme.headline6,
      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: darkerBlue));
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.cabin().fontFamily,
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: MyTheme.darkCream,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: Theme.of(context).textTheme.copyWith(
            headline6:
                context.textTheme.headline6.copyWith(color: Colors.white)).bodyText2, titleTextStyle: Theme.of(context).textTheme.copyWith(
            headline6:
                context.textTheme.headline6.copyWith(color: Colors.white)).headline6,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white));

  static Color cream = const Color(0xfff5f5f5);
  static Color darkCream = Vx.gray900;
  static Color darkerBlue = const Color(0xff403b58);
  static Color lighterBlue = Vx.indigo400;
}

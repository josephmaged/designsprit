import 'package:designsprit/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kPrimaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kPrimaryColor,
    unselectedItemColor: kLightGrey,
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
);

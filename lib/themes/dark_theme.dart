import 'package:flutter/material.dart';

var darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  // primaryColor: const Color.fromARGB(26, 233, 233, 233),
  primaryColor: const Color(0xff272727),
  scaffoldBackgroundColor: const Color.fromARGB(255, 18, 18, 18),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 18, 18, 18),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme(
    color: const Color.fromARGB(255, 30, 30, 30),
    elevation: 1,
    surfaceTintColor: const Color.fromARGB(255, 50, 50, 50),
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Color.fromARGB(255, 40, 40, 40), width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    shadowColor: Colors.black,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    secondary: const Color.fromARGB(143, 58, 58, 58),
    background: const Color.fromARGB(255, 18, 18, 18),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 18, 18, 18),
    elevation: 1,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
);

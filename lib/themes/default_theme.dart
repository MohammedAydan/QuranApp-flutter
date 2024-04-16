import 'package:flutter/material.dart';

var defaultTheme = ThemeData.light(useMaterial3: true).copyWith(
  primaryColor: const Color.fromARGB(255, 231, 231, 231),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    surfaceTintColor: Colors.grey.shade700,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 1,
    surfaceTintColor: const Color.fromARGB(255, 206, 206, 206),
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.grey.shade200, width: 1),
      borderRadius: BorderRadius.circular(20),
    ),
    shadowColor: Colors.black,
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color.fromARGB(255, 231, 231, 231),
    background: Colors.white,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 1,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),
);

import 'package:flutter/material.dart';
import 'package:list_order/utils/app_colors.dart';

class Themes {
  final theme = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w300,
        ),
      ),
      textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21,
          ),
          displaySmall: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
          titleLarge: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          )));
}

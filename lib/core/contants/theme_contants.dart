import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData getTheme(context) {
    return ThemeData(
      dialogBackgroundColor: Colors.white,
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      primaryColor: const Color(0xff2AB298),
      primarySwatch: Colors.grey,
      primaryColorDark: Colors.green,
      primaryColorLight: Colors.white,
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: const Color(0xff2AB298),
          elevation: 0.0,
          titleTextStyle:
              // ignore: use_full_hex_values_for_flutter_colors
              const TextStyle(fontSize: 20, color: Colors.white),
          iconTheme: const IconThemeData(color: Color(0xff593485))),
    );
  }
}

const Color kBackgroundColor = Color(0xffF7F8F0);
const Color kSecondaryColor = Color(0xff593485);
const Color kfontColorLight = Colors.white;
const Color kfontColorDark = Colors.black;

const double kfontSmall = 12.0;
const double kfontMedium = 16.0;
const double kfontLarge = 20.0;
const double kfontExLarge = 24.0;

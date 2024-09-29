import 'package:flutter/cupertino.dart';

class AppColors {
  static int get primary => 0xFF415170;
  static int get second => 0;
  static int get blue => 0xff1e4fe3;
  static int get black => 0xFF1c1c1c;
  static int get red => 0xFFc1121f;

  static const gradientApp = LinearGradient(
    colors: [
      Color(0xff1e4fe3),
      Color(0xff0d41e1),
    ],
  );
}
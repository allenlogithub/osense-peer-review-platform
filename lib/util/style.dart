import 'package:flutter/material.dart';

class ThemeColor {
  static Color primary = const Color.fromRGBO(128, 206, 211, 1.0);
  static Color secondary = const Color.fromRGBO(170, 138, 116, 1.0);
  static Color bgPrimary = const Color.fromRGBO(162, 206, 211, 0.25);
  static Color bgSecondary = const Color.fromRGBO(170, 138, 116, 0.25);
}

class StatusColor {
  static Color success = const Color.fromRGBO(102, 180, 175, 1.0);
  static Color bgSuccess = const Color.fromRGBO(102, 180, 175, 0.25);
  static Color alert = const Color.fromRGBO(242, 166, 59, 1.0);
  static Color bgAlert = const Color.fromRGBO(242, 166, 59, 0.25);
  static Color error = const Color.fromRGBO(237, 116, 112, 1.0);
  static Color bgError = const Color.fromRGBO(237, 116, 112, 0.25);
  static Color info = const Color.fromRGBO(125, 193, 220, 1.0);
  static Color bgInfo = const Color.fromRGBO(125, 193, 220, 0.25);
  static Color muted = const Color.fromRGBO(136, 136, 136, 1.0);
  static Color bgMuted = const Color.fromRGBO(136, 136, 136, 0.25);
}

class GrayColor {
  static Color white = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color light = const Color.fromRGBO(187, 187, 187, 1.0);
  static Color grey = const Color.fromRGBO(136, 136, 136, 1.0);
  static Color dark = const Color.fromRGBO(68, 68, 68, 1.0);
  static Color black = const Color.fromRGBO(0, 0, 0, 1.0);
}

class Text {
  static TextStyle normH1 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 48);
  static TextStyle normH2 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 36);
  static TextStyle normH3 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 24);
  static TextStyle normH4 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
  static TextStyle normH5 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 16);
  static TextStyle normH6 =
      const TextStyle(fontWeight: FontWeight.normal, fontSize: 14);
  static TextStyle boldH1 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 48);
  static TextStyle boldH2 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 36);
  static TextStyle boldH3 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 24);
  static TextStyle boldH4 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  static TextStyle boldH5 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle boldH6 =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
}

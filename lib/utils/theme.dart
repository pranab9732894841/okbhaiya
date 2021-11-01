import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: const Color(0xfff72585),
    // ignore: deprecated_member_use
    accentColor: const Color(0xfffca311),
    indicatorColor: const Color(0xff023e8a),
    scaffoldBackgroundColor: const Color(0xffe5e5e5),
    hintColor: const Color(0xFF454C55),
    backgroundColor: const Color(0xffFFFFFF),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    colorScheme: const ColorScheme.light(
        primary: Color(0xfff72585), secondary: Color(0xfffca311)),
    iconTheme: const IconThemeData(
      color: Color(0xff023e8a),
      size: 20.0,
    ),
  );
}

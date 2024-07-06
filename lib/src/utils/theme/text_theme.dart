import 'package:flutter/material.dart';

extension CustomTheme on TextTheme {
  TextStyle get nanum => const TextStyle(fontFamily: "Nanum", fontWeight: FontWeight.w400, color: Colors.black);
  TextStyle get cafe24 => const TextStyle(fontFamily: "Cafe24", fontWeight: FontWeight.w400, color: Colors.black);
}
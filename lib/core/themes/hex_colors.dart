import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", "");
  if (hex.length == 6) {
    return Color(int.parse("0xFF$hex"));
  } else if (hex.length == 3) {
    /// Expand shorthand hex code (e.g., #123 -> #112233)
    hex = hex.split("").map((char) => "$char$char").join();
    return Color(int.parse("0xFF$hex"));
  }
  throw ArgumentError("Invalid hex color format: $hex");
}
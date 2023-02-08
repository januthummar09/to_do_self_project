import 'package:flutter/material.dart';

class TextDeco {
  TextStyle textDecoration({double? size, FontWeight? fontWeight}) {
    return TextStyle(
      color: const Color.fromRGBO(56, 60, 66, 1),
      fontSize: size ?? 18,
      fontWeight: fontWeight,
    );
  }
}

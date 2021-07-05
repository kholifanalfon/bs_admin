import 'package:flutter/material.dart';

class HoverDecoration {

  const HoverDecoration({
    this.backgroundColor = Colors.blueAccent,
    this.splashColor = const Color(0xff22457f),
    this.highlightColor = const Color(0xff366ecc),
    this.color = Colors.white,
  });

  final Color backgroundColor;

  final Color splashColor;

  final Color highlightColor;

  final Color color;

  static const HoverDecoration blueAccent = HoverDecoration(
    backgroundColor: Color(0xff366ecc),
    color: Colors.white,
  );
}
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class Utils {
  static const BoxShadow shadowRegular = BoxShadow(
    color: Color(0xffd9d9d9),
    spreadRadius: 4.0,
    blurRadius: 12.0
  );

  static const BsCardStyle boxCard = BsCardStyle(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      boxShadow: [
        Utils.shadowRegular
      ]
    )
  );
}
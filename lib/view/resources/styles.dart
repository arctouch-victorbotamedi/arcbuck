import 'package:arcbuck/view/resources/theme_colors.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {

  static const shadowStyle = BoxShadow(
    spreadRadius: 0,
    color: ThemeColors.shadowColor,
    blurRadius: 15.0,
  );

  static const largeBoldTextStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold
  );

  static const boldTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold
  );

  static const primaryTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600
  );

  static const secondaryTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: ThemeColors.grey
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_xiag_test/res/custom_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles{
  static final mainTheme = ThemeData(
    fontFamily: 'Roboto',
    accentColor: CustomColors.accentColor,
    scaffoldBackgroundColor: Colors.white,
  );

  static final buttonTextStyle =
  TextStyle(fontSize: 15.sp, color: Colors.white);
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dimens {
  //Size screen
  static const widthScreen = 360.0;
  static const heightScreen = 780.0;

  //Radius
  static const imageItemRadius = 8.0;
  static final borderRadiusButton = BorderRadius.circular(8);
  static const searchRadius = BorderRadius.all(Radius.circular(16.0));

  //Paddings
  static final paddingL8 = EdgeInsets.only(left: 8.w);
  static final paddingButton =
      EdgeInsets.only(top: 8.h, left: 8.w, right: 8.w, bottom: 8.h);
  static final paddingT8 = EdgeInsets.only(top: 8.h);
  static final paddingT16 = EdgeInsets.only(top: 16.h);
  static final textFieldContentPadding =
      EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h, bottom: 6.h);
  static final paddingSearch =
  EdgeInsets.only(left: 16.w, top: 24.h, right: 16.w, bottom: 16.h);

  //Sizes
  static final imageThumbnailWidth = 250.w;
  static final imageThumbnailHeight = 150.w;
  static final circularProgressBarSize = 40.w;
  static final appBarSize = Size(widthScreen, 50.h);

}

import 'package:flutter/cupertino.dart';

class Layout {
  static double commonPadding = Size.blockSizeHorizontal;
  static double mainAxisSpacing = Size.blockSizeHorizontal;
  static double crossAxisSpacing = Size.blockSizeHorizontal;
  static double commonBorderWidth = 3.0;
  static double commonBorderRadius = 10.0;
  static double iconSize = Size.blockSizeHorizontal * 3;
  static double widgetSpace = Size.blockSizeHorizontal;
  static double drawerIconInterval = Size.blockSizeHorizontal * 3;
}

class Size {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double blockSize = (blockSizeVertical > blockSizeHorizontal)
      ? blockSizeHorizontal
      : blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

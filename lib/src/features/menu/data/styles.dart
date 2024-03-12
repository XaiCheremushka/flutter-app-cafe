import 'package:flutter/material.dart';
import 'package:flutter_course/src/theme/app_colors.dart';

class TextStyles {

  static const title = TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static const subtitle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  static const price = TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4
  );

  static const priceChange = TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.4
  );

  static const chipActive = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const chip = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

}


class ButtonStyles {

  static ButtonStyle button_style = ElevatedButton.styleFrom(
    elevation: 10,
    alignment: Alignment.center,
    backgroundColor: AppColors.mainColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.zero,
  );

  static ButtonStyle unactive_button_style = ElevatedButton.styleFrom(
    elevation: 10,
    alignment: Alignment.center,
    backgroundColor: AppColors.unactiveMainColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: EdgeInsets.zero,
  );
}
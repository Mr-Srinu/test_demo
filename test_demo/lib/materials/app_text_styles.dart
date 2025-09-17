import 'package:flutter/material.dart'; // <-- Use this
import 'app_colors.dart';

class AppTextStyles {
  // Main headings like "No Leads yet!"
  static final TextStyle heading1 = const TextStyle(
    // fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  );

  static final TextStyle bodyText1 = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w900,
    color: AppColors.primaryText,
  );

  static final TextStyle bodyText2 = const TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 14,
    color: AppColors.secondaryText,
  );

  static final TextStyle boldText = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryText,
  );

  static final TextStyle buttonText = const TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.buttonWhite,
  );

  static final TextStyle tabText = const TextStyle(
    // fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle unSelectedTabText = const TextStyle(
    fontSize: 15,
    // fontWeight: FontWeight.w600,
  );

  static final TextStyle badgeText = const TextStyle(
    // fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonWhite,
  );

}

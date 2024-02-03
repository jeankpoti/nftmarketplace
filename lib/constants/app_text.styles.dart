import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Styles class holding app text styles
class AppTextStyles {
  /// Text style for heading 1 text
  static TextStyle title = GoogleFonts.acme(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );

  /// Text style for heading 2 text
  static TextStyle subtitle = GoogleFonts.acme(
    fontSize: 25.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );

  /// Text style for titleSm Button
  static TextStyle buttonText = GoogleFonts.acme(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.titleColor,
  );
  static TextStyle bodyLg = GoogleFonts.acme(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyColor,
  );

  /// Text style for body text
  static TextStyle body = GoogleFonts.acme(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyColor,
  );
}

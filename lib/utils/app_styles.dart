import 'package:drivers_tracking_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle semiBold24White=GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 24.sp,color: AppColors.whiteColor);
  static TextStyle light16White=GoogleFonts.poppins(fontWeight: FontWeight.w300,fontSize: 16.sp,color: AppColors.whiteColor);
  static TextStyle medium18White=GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 18.sp,color: AppColors.whiteColor);
  static TextStyle light18ShadedBlack=GoogleFonts.poppins(fontWeight: FontWeight.w300,fontSize: 18.sp,color: AppColors.shadedBlackColor);
  static TextStyle regular18White=GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 18.sp,color: AppColors.whiteColor);
  static TextStyle semiBold20Primary=GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 20.sp,color: AppColors.primaryColor);
  static TextStyle bold24Golden=GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 24.sp,color: AppColors.goldenColor);
}
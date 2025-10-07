import 'package:drivers_tracking_app/utils/app_colors.dart';
import 'package:drivers_tracking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;
  String butTitle;
  Color backgroundColor;
  Color borderSideColor;
  bool hasIcon;
  Widget? widget;
  CustomElevatedButton({super.key,required this.onPressed,required this.butTitle,this.backgroundColor=AppColors.whiteColor,this.borderSideColor=AppColors.whiteColor,this.hasIcon=false,this.widget});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(color: borderSideColor)
        ),
        padding: EdgeInsets.symmetric(vertical: 23.h)
      ),
      onPressed:onPressed, 
      child:hasIcon?widget: Text(butTitle,style: AppStyles.semiBold20Primary,)
    );
  }
}
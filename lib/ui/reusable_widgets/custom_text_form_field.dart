import 'package:drivers_tracking_app/utils/app_colors.dart';
import 'package:drivers_tracking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef OnValidator=String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  Color fillColor;
  Color borderSideColor;
  String? hintText;
  TextStyle? hintStyle;
  TextStyle? inputStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  OnValidator? validator;
  TextEditingController controller;
  TextInputType keyBoardType;
  bool obscureText;
  String obscuringCharacter;
  Color? cursorColor;
  double? radius;
  bool filled;
  CustomTextFormField({super.key,this.filled=true,this.radius,this.fillColor=AppColors.whiteColor,this.borderSideColor=AppColors.whiteColor,this.hintText,this.hintStyle,this.prefixIcon,this.suffixIcon,this.maxLines,this.validator,required this.controller,this.keyBoardType=TextInputType.text,this.obscureText=false,this.obscuringCharacter=".",this.cursorColor,this.inputStyle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: inputStyle??AppStyles.light18ShadedBlack,
      cursorColor:cursorColor??AppColors.primaryColor ,
      obscureText: obscureText,
      maxLines: maxLines??1,
      validator: validator,
      controller: controller,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        filled:filled ,
        fillColor:fillColor ,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle??AppStyles.light18ShadedBlack,
        enabledBorder: buildMyBorder(borderSideColor: borderSideColor),
        focusedBorder: buildMyBorder(borderSideColor: borderSideColor),
        errorBorder: buildMyBorder(borderSideColor: AppColors.redColor),
        focusedErrorBorder: buildMyBorder(borderSideColor: AppColors.redColor),
        errorStyle: AppStyles.semiBold20Primary.copyWith(color: AppColors.redColor,fontSize: 14.sp)
      ),
    );
  }
  OutlineInputBorder buildMyBorder({required borderSideColor}){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius??16.r),
      borderSide: BorderSide(width: 1,color: borderSideColor)
    );
  }
}
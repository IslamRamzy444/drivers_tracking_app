import 'package:drivers_tracking_app/utils/app_colors.dart';
import 'package:drivers_tracking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading({required BuildContext context,required String loadingText}){
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(color: AppColors.primaryColor,),
            Text(loadingText,style: AppStyles.semiBold20Primary.copyWith(fontSize: 16.sp),)
          ],
        ),
      ),
    );
  }
  static void removeLoading({required BuildContext context}){
    Navigator.pop(context);
  }
  static void showMessage({required BuildContext context,String? title,required String message,String? posActionName,Function? posAction,String? negActionName,Function? negAction}){
    List<Widget>? actions=[];
    if(posActionName!=null){
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          posAction?.call();
        }, 
        child: Text(posActionName,style: AppStyles.light18ShadedBlack,)
      )
      );
    }
    if(negActionName!=null){
      actions.add(TextButton(
        onPressed: () {
          Navigator.pop(context);
          negAction?.call();
        }, 
        child: Text(negActionName,style: AppStyles.light18ShadedBlack,)
      )
      );
    }
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(title?? '',style: AppStyles.light18ShadedBlack,),
        content: Text(message,style: AppStyles.light18ShadedBlack,),
        actions: actions,
      ),
    );
  }
}
import 'package:drivers_tracking_app/ui/reusable_widgets/custom_elevated_button.dart';
import 'package:drivers_tracking_app/ui/reusable_widgets/custom_text_form_field.dart';
import 'package:drivers_tracking_app/utils/app_colors.dart';
import 'package:drivers_tracking_app/utils/app_styles.dart';
import 'package:drivers_tracking_app/utils/app_validators.dart';
import 'package:drivers_tracking_app/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool codeSent = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController roleController=TextEditingController();
  TextEditingController fileNumberController=TextEditingController();
  TextEditingController carPlateNumberController=TextEditingController();
  TextEditingController carModelController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("El Beheira Company\nTracking App",style: AppStyles.bold24Golden,),
              SizedBox(height: 40.h,),
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Full Name",style: AppStyles.medium18White,),
                      SizedBox(height: 24.h,),
                      CustomTextFormField(
                        controller: nameController,
                        hintText: "Enter your full name",
                        validator: AppValidators.validateFullName,
                      ),
                      SizedBox(height: 32.h,),
                      Text("Phone number",style: AppStyles.medium18White,),
                      SizedBox(height: 24.h,),
                      CustomTextFormField(
                        controller: phoneController,
                        keyBoardType: TextInputType.phone,
                        hintText: "Enter your phone (e.g. +201234567890)",
                        validator: AppValidators.validatePhoneForFirebase,
                      ),
                      SizedBox(height: 32.h,),
                      Text("Role",style: AppStyles.medium18White,),
                      SizedBox(height: 24.h,),
                      CustomTextFormField(
                        controller: roleController,
                        hintText: "Enter your role(driver/admin)",
                        validator: AppValidators.validateRole,
                      ),
                      SizedBox(height: 32.h,),
                      Text("File Number",style: AppStyles.medium18White,),
                      SizedBox(height: 24.h,),
                      CustomTextFormField(
                        controller: fileNumberController,
                        hintText: "Enter your file number",
                        validator: AppValidators.validateFileNumber,
                      ),
                      SizedBox(height: 32.h,),
                      Text("Car Plate Number",style: AppStyles.medium18White,),
                      SizedBox(height: 24.h,),
                      CustomTextFormField(
                        controller: carPlateNumberController,
                        hintText: "Enter the plate number of your car",
                        validator: (text) {
                          return AppValidators.validateCarPlateNoAndModel(text, roleController.text);
                        },
                      ),
                      SizedBox(height: 32.h,),
                      Text("Car Model",style: AppStyles.medium18White,),
                      SizedBox(height: 24.h,),
                      CustomTextFormField(
                        controller: carModelController,
                        hintText: "Enter the model of your car",
                        validator: (text) {
                          return AppValidators.validateCarPlateNoAndModel(text, roleController.text);
                        },
                      ),
                      if (codeSent) ...[
                        SizedBox(height: 32.h,),
                        Text("Verification Code", style: AppStyles.medium18White),
                        SizedBox(height: 24.h,),
                        CustomTextFormField(
                          controller: codeController,
                          keyBoardType: TextInputType.number,
                          hintText: "Enter 6-digit code",
                          validator: AppValidators.validateOTP,
                        )
                      ],
                      SizedBox(height: 56.h,),
                      CustomElevatedButton(
                        onPressed: () {
                          codeSent?onVerifyCode():onSendCode();
                        }, 
                        butTitle: codeSent?"Send Code":"Verify Code"
                      )
                    ],
                  ),
                )
              ),
              SizedBox(height: 32.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: AppStyles.medium18White,),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Go and sign in",style: AppStyles.medium18White,)
                  )
                ],
              ),
              SizedBox(height: 32.h,),
            ],
          ),
        )
      ),
    );
  }
  void onSendCode(){
    if(formKey.currentState?.validate()!=true) return;
    setState(() {
      codeSent=true;
    });
    ToastUtils.showMsg(msg: "Verification code sent", backgroundColor: AppColors.greenColor, textColor: AppColors.whiteColor);
  }
  void onVerifyCode(){
    if (formKey.currentState?.validate() != true) return;
    ToastUtils.showMsg(msg: "Code verified successfully",backgroundColor: AppColors.greenColor,textColor: AppColors.whiteColor,);
  }
}
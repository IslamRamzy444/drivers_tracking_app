class AppValidators {
  AppValidators._();
  static String? validateEmail(String? val){
    RegExp emailRegex=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(val==null || val.trim().isEmpty){
      return "This Field is requied";
    }else if(emailRegex.hasMatch(val.trim())==false){
      return "Enter a valid email";
    }else{
      return null;
    }
  }
  static String? validatePassword(String? val){
    RegExp passwordRegex=RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if(val==null || val.trim().isEmpty){
      return "This Field is required";
    }else if(val.length<8 || passwordRegex.hasMatch(val.trim())==false){
      return "Enter a valid password";
    }else{
      return null;
    }
  }
  static String? validateConfirmPassword(String? val,String? password){
    if(val==null || val.trim().isEmpty){
      return "This Field is required";
    }else if(val.trim()!=password?.trim()){
      return "Passwords not matching";
    }else{
      return null;
    }
  }
  static String? validateUserName(String? val){
    RegExp userNameRegex=RegExp(r'^[a-zA-Z0-9,.-]+$');
    if(val==null || val.trim().isEmpty){
      return "This Field is required";
    }else if(!userNameRegex.hasMatch(val.trim())){
      return "Enter a valid user name";
    }else{
      return null;
    }
  }
  static String? validateFullName(String? val){
    if(val==null || val.trim().isEmpty){
      return "This Field is required";
    }else{
      return null;
    }
  }
  static String? validatePhoneNumber(String? val){
    if(val==null){
      return "This Field is required";
    }else if(int.tryParse(val.trim())==null){
      return "Enter numbers only";
    }else if(val.trim().length!=11){
      return "Enter a value must equal 11 digit";
    }else{
      return null;
    }
  }
  static String? validateRole(String? val){
    if(val==null || val.trim().isEmpty){
      return "This Field is Required";
    }else if(val.trim().toLowerCase()!="driver" && val.trim().toLowerCase()!="admin"){
      return "Invalid role! Please type a valid role (driver/admin)";
    }else{
      return null;
    }
  }
  static String? validateFileNumber(String? val){
    if(val==null || val.trim().isEmpty){
      return "This Field is Required";
    }else if(int.tryParse(val.trim())==null){
      return "Enter numbers only";
    }else{
      return null;
    }
  }
  static String? validateCarPlateNoAndModel(String? val, String?role){
    if((val==null || val.trim().isEmpty)&& (role?.trim().toLowerCase()=="driver")){
      return "This Field is Required";
    }else{
      return null;
    }
  }
}
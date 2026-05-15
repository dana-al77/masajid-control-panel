import 'package:get/get.dart';

validInput(String val ,int min ,int max ,String type){

  List<String> allowedValues = ["A", "B", "C"];


  if (type == "enum") {
    if (!allowedValues.contains(val)) {
      return "القيمة المدخلة غير صالحة";  // ممكن تعوّض برسالة ترجمة
    }
  }

  if(type == "name"){

    // if(!GetUtils.isUsername(val)){
    //   return "33".tr;
    // }

  }

  if(type == "email"){

    // if(!GetUtils.isEmail(val)){
    //   return "34".tr;
    // }

  }
  if(type == "boolean"){

    // if(!GetUtils.isEmail(val)){
    //   return "34".tr;
    // }

  }

  if(type == "number"){

    // if(!GetUtils.isEmail(val)){
    //   return "34".tr;
    // }

  }
  if(type == "password"){
    // RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$');
    // if (!regex.hasMatch(val)) {
    //   return "كلمة المرور يجب أن تحتوي على حرف كبير وصغير ورقم ورمز خاص، وأن لا تقل عن 8 أحرف.";
    // }
  }
  if(type == "phone"){

    // if(!GetUtils.isPhoneNumber(val)){
    //   return "35".tr;
    // }

  }

  if(type == "image"){

    // if(!GetUtils.isPhoneNumber(val)){
    //   return "35".tr;
    // }

  }
if(val.length < min){
  return "36".tr + min.toString();
}

  if(val.length > max){
    return "37".tr + max.toString();
  }
  // if(val.isEmpty){
  //   return "38".tr ;
  // }
}
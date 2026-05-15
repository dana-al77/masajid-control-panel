import 'package:ecommaerce_course/core/class/crud.dart';
import 'package:ecommaerce_course/link_api.dart';

class ResetPasswordData{

  Crud crud;

  ResetPasswordData(this.crud);

  postData(String code,String password,String password_confirmation) async{
    var response =await crud.PostData(AppLink.resetpassword, {
      "code" :code ,
      "password" : password,
      "password_confirmation":password_confirmation

    });

    return response.fold((l) => l, (r) => r);
  }

}
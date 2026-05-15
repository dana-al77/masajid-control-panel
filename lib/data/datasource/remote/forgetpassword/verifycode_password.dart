import 'package:ecommaerce_course/core/class/crud.dart';
import 'package:ecommaerce_course/link_api.dart';

class VerifyCodeForgetPassword{

  Crud crud;

  VerifyCodeForgetPassword(this.crud);

  postData(String email,String verifycode) async{
    var response =await crud.PostData(AppLink.verifycodeforgetpassword, {
      "email" :email ,
      "code" : verifycode,


    });

    return response.fold((l) => l, (r) => r);
  }

}
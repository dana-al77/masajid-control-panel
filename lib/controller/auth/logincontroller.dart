import 'package:ecommaerce_course/core/constant/routes.dart';
import 'package:ecommaerce_course/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LogginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}
class LoginControllerImp extends LogginController{
  GlobalKey<FormState> formstate= GlobalKey<FormState>();
  late TextEditingController email ;
  late TextEditingController password ;

  bool isShowPassword = true;
  MyServices myServices=Get.find();
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest =StatusRequest.none;

  showPassword(){
    isShowPassword = isShowPassword == true ?false :true;
    update();
  }

  @override
  login() async{
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
        email.text,
        password.text,


      );
      print("==============================response $response");
      statusRequest = handlingData(response);
     if (StatusRequest.success == statusRequest) {

         if (response['success'] == true) {
           myServices.sharedPreferences.setString("id", response["data"]["id"].toString());
          myServices.sharedPreferences.setString("name", response["data"]["name"]);
           myServices.sharedPreferences.setString("email", response["data"]["email"]);
          myServices.sharedPreferences.setString("email", response["data"]["admin"]["password"]);
           myServices.sharedPreferences.setString("token", response["data"]["token"]);

           myServices.sharedPreferences.setString("step", "2");

           Get.offNamed(AppRoute.Dashboard);
              } else {
          Get.defaultDialog(
            title: 'warning',
            middleText: 'Email OR password Not Correct',
          );
          statusRequest = StatusRequest.failure;

        }
      }
      update();
    } else {
      print(" not valid");
    }
  }

  @override
  goToSignUp() {
  Get.offNamed(AppRoute.signup);
  }

  @override
  goToForgetPassword() {
 Get.toNamed(AppRoute.forgetpassword);
  }
@override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value){
    //   print("🔥 Firebase token: $value");
    //  String? token = value ;
    // });
    email =TextEditingController();
    password =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }


}
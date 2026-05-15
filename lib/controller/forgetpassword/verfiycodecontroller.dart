import 'package:ecommaerce_course/core/constant/routes.dart';
import 'package:ecommaerce_course/data/datasource/remote/forgetpassword/verifycode_password.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class VerfiyCodecontroller extends GetxController{

  goToresetPassword(String VerifyCode);
}
class VerfiyCodecontrollerImp extends VerfiyCodecontroller{
  String? email;

  VerifyCodeForgetPassword verifyCodeForgetPassword =VerifyCodeForgetPassword(Get.find());
  StatusRequest statusRequest =StatusRequest.none;



  @override
  goToresetPassword(VerifyCode)async {
   // statusRequest = StatusRequest.loading;
    //update();
    var response = await verifyCodeForgetPassword.postData(email!,VerifyCode
    );
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['message'] == "passwords.code_is_valid") {
        Get.offNamed(AppRoute.resetpassword,arguments: {
        //  "email" :email
          "code": VerifyCode  // هذا هو الكود الصحيح الذي تسلمه المستخدم

        });
      }
      else {
        Get.defaultDialog(
          title: 'warning',
          middleText: 'Not Correct',
        );
     statusRequest = StatusRequest.failure;

      }
    }else{
      Get.defaultDialog(
        title: 'warning',
        middleText: 'COde Not Correct',
      );
    }
   // update();

  }
  @override
  void onInit() {

    email =Get.arguments['email'];
    super.onInit();
  }


}
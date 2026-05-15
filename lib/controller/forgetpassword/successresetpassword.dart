import 'package:ecommaerce_course/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController{

  goToPagrLogin();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController{
  @override
  goToPagrLogin() {
   Get.offAllNamed(AppRoute.login);
  }

}
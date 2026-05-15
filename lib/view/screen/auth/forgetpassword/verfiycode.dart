import 'package:ecommaerce_course/core/class/statusrequest.dart';
import 'package:ecommaerce_course/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../../controller/forgetpassword/verfiycodecontroller.dart';
import '../../../../core/class/handling_data_view.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtexttitlleauth.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
      Get.put(VerfiyCodecontrollerImp());
    return Scaffold(
      backgroundColor: AppColor.white1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white1,
          //   elevation: 0.0,
          title: Text("21".tr ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor,),
          ),),
        body: GetBuilder<VerfiyCodecontrollerImp>(builder: (controller) =>
    handlingDataRequest(statusRequest:  controller.statusRequest,
    widget:  Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              child: ListView(children: [
                SizedBox(height: 50,),
                CustomTextTitleAuth(text: "22".tr,),
                SizedBox(height: 20,),
                CustomTextBodyAuth(text: "23".tr,),
                SizedBox(height: 65,),

                OtpTextField(
                  fieldWidth: 45.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 6,
                  borderColor: AppColor.black, // اللون الأساسي للـ border
                  focusedBorderColor: AppColor.primaryColor, // لون الـ border عند التركيز
                  showFieldAsBox: true,
                  textStyle: TextStyle(
                    color: AppColor.primaryColor, // لون النص داخل الخانات
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  onCodeChanged: (String code) {
                    // كود اختياري
                  },
                  onSubmit: (String verificationCode) {
                    controller.goToresetPassword(verificationCode);
                  },
                )


              ],),




    ))
          ,)
    );
  }
}

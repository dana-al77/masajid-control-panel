import 'package:ecommaerce_course/controller/auth/add_manamger_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_data_view.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/valid_input.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitlleauth.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddUserControllerImp());

    return Scaffold(
        backgroundColor: AppColor.white1,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white1,
          //   elevation: 0.0,
          title: Text("Add user" ,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColor.primaryColor,),
          ),
        ),
        body:
        GetBuilder<AddUserControllerImp>(builder: (controller) =>
            handlingDataRequest(statusRequest:  controller.statusRequest,
              widget:  Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(children: [
                    CustomTextFormAuth(
                      hindtext: "13".tr,
                      labeltext: "12".tr,
                      iconData: Icons.person, mycontroller: controller.full_name,
                      valid: (val){
                        return validInput(val!, 3, 100, "name");
                      }, isNumber: false,
                    ),
                    CustomTextFormAuth(
                      hindtext: "6".tr,
                      labeltext: "5".tr,
                      iconData: Icons.email_outlined,
                      mycontroller: controller.email,
                      valid: (val){
                        return validInput(val!, 5, 100, "email");
                      }, isNumber: false,
                    ),


                    GetBuilder<AddUserControllerImp>(builder: (controller) =>
                        CustomTextFormAuth(
                          obscureText: controller.isShowPassword,
                          onTapIcon: (){
                            controller.showPassword();
                          },
                          hindtext: "8".tr,
                          labeltext: "7".tr,
                          iconData: Icons.lock_outline,
                          mycontroller: controller.password,
                          valid: (val){
                            return validInput(val!, 5, 80, "password");
                          }, isNumber: false,
                        ),
                    ),
                    GetBuilder<AddUserControllerImp>(builder: (controller) =>
                        CustomTextFormAuth(
                          obscureText: controller.isShowPassword,
                          onTapIcon: (){
                            controller.showPassword();
                          },
                          hindtext: "8".tr,
                          labeltext: "7".tr,
                          iconData: Icons.lock_outline,
                          mycontroller: controller.password_confirmation,
                          valid: (val){
                            return validInput(val!, 5, 80, "password");
                          }, isNumber: false,
                        ),
                    ),
                    CustomTextFormAuth(
                      hindtext: "mother",
                      labeltext: "mother",
                      iconData: Icons.person,
                      mycontroller: controller.mother_name,
                      valid: (val){
                        return validInput(val!, 6, 13, "name");
                      }, isNumber: false,
                    ),
                    CustomTextFormAuth(
                      hindtext: "old",
                      labeltext: "old",
                      iconData: Icons.person,
                      mycontroller: controller.old,
                      valid: (val){
                        return validInput(val!, 3, 13, "name");
                      }, isNumber: true,
                    ),
                    CustomTextFormAuth(
                      hindtext: "15".tr,
                      labeltext: "14".tr,
                      iconData: Icons.phone_android,
                      mycontroller: controller.mynumber,
                      valid: (val){
                        return validInput(val!, 6, 13, "phone");
                      }, isNumber: true,
                    ),
                    CustomTextFormAuth(
                      hindtext: "location",
                      labeltext: "location",
                      iconData: Icons.location_on,
                      mycontroller: controller.addess,
                      valid: (val){
                        return validInput(val!, 2, 13, "name");
                      }, isNumber: true,
                    ),
                    CustomTextFormAuth(
                      hindtext: "work",
                      labeltext: "work",
                      iconData: Icons.work,
                      mycontroller: controller.ago_work,
                      valid: (val){
                        return validInput(val!, 6, 13, "name");
                      }, isNumber: true,
                    ),
                    CustomTextFormAuth(
                      hindtext: "study",
                      labeltext: "study",
                      iconData: Icons.menu_book,
                      mycontroller: controller.studing,
                      valid: (val){
                        return validInput(val!, 6, 13, "name");
                      }, isNumber: true,
                    ),

                    CustomButtonAuth(text: "11".tr,onPressed: (){
                      controller.AddManager();
                    },),
                    SizedBox(height: 30,),

                  ],),
                ),
              ),)

        )
    );
  }
}

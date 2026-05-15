import 'package:ecommaerce_course/controller/manager/view.dart';
import 'package:ecommaerce_course/core/constant/routes.dart';
import 'package:ecommaerce_course/data/datasource/remote/auth/add_manger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/manager/manager_data.dart';
import '../../data/datasource/remote/mosque.dart';
import '../../data/model/mosque_model.dart';

abstract class AddManagerController extends GetxController {
  AddManager();
}

class AddManagerControllerImp extends AddManagerController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late MyServices myServices;
  late TextEditingController full_name;
  late TextEditingController mother_name;
  late TextEditingController birth_date;
  late TextEditingController national_id;
  late TextEditingController address;
  late TextEditingController previous_job;
  late TextEditingController education_level;
  late TextEditingController phone;
  late TextEditingController role;

  StatusRequest statusRequest = StatusRequest.none;

  ManagerData addmanagertData = ManagerData(Get.find());

  List data = [];
  MosqueData mosqueData = MosqueData(Get.find());

  List<MosqueModel> mosqueList = [];
  String? selectedMosqueId;

  @override
  AddManager() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addmanagertData.postData(
        fullName: full_name.text,
        motherName: mother_name.text,
        birthDate: birth_date.text,
        nationalId: national_id.text,
        address: address.text,
        previousJob: previous_job.text,
        educationLevel: education_level.text,
        phone: phone.text,
        role: role.text,
        mosqueId: selectedMosqueId.toString(),
      );
      print("🎯 Add Response: $response");
      print("==============================response $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['success'] == true) {
          Get.defaultDialog(
            title: 'success',
            middleText: 'Added Successfully',
          );
          Get.to(AppRoute.Manager);
          ViewAllManagerControllerImp c = Get.find();
          c.GetAllManager();
          print("valid");
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print(" not valid");
    }
  }

  @override
  void onInit() {
    full_name = TextEditingController();
    mother_name = TextEditingController();
    birth_date = TextEditingController();
    national_id = TextEditingController();
    address = TextEditingController();
    previous_job = TextEditingController();
    education_level = TextEditingController();
    phone = TextEditingController();
    role = TextEditingController();
    getMosques(); // 👈 استدعاء جلب المساجد
    super.onInit();
  }

  void getMosques() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await mosqueData.get();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['success'] == true) {
        List mosqueRaw = response['data'];
        mosqueList = mosqueRaw.map((e) => MosqueModel.fromjson(e)).toList();
      }
    }

    update();
  }

  @override
  void dispose() {
    full_name.dispose();
    mother_name.dispose();
    birth_date.dispose();
    national_id.dispose();
    address.dispose();
    previous_job.dispose();
    education_level.dispose();
    phone.dispose();
    role.dispose();
    super.dispose();
  }
}

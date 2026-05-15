import 'package:ecommaerce_course/core/constant/routes.dart';
import 'package:ecommaerce_course/data/datasource/remote/manager/manager_data.dart';
import 'package:ecommaerce_course/data/model/manager_model.dart';
import 'package:ecommaerce_course/data/model/mosque_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/mosque.dart';

abstract class ViewArchiveManagerController extends GetxController {
  GetArchivwMoanager();
}

class ViewArchiveManagerControllerImp extends ViewArchiveManagerController {
  StatusRequest statusRequest = StatusRequest.none;

  ManagerData managerData = ManagerData(Get.find());

  List<ManagerModel> data = [];

  @override
  GetArchivwMoanager() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await managerData.getArchive();
    print("==============================response $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['success'] == true) {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ManagerModel.fromJson(e)));
        print("valid");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void restoreItem(int id) async {
    StatusRequest status = StatusRequest.loading;
    update();

    var response = await managerData.restore(id);
    if (response['success'] == true) {
      data.removeWhere((element) => element.id == id);
      statusRequest = StatusRequest.success;
      update();
    } else {
      Get.snackbar("خطأ", "فشل استعادة المدراء");
    }
  }

  @override
  void onInit() {
    GetArchivwMoanager();
    super.onInit();
  }

  myback() {
    Get.offAllNamed(AppRoute.Manager);
    return Future.value(false);
  }
}

import 'package:ecommaerce_course/core/constant/routes.dart';
import 'package:ecommaerce_course/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddeeWare extends GetMiddleware{

  int? get priority => 1;

  MyServices myServices =Get.find();

  @override
  RouteSettings? redirect(String? route) {


    if(myServices.sharedPreferences.getString("step") == "2"){
      return RouteSettings(name: AppRoute.Dashboard);
    }

    if(myServices.sharedPreferences.getString("step") == "1"){
      return RouteSettings(name: AppRoute.login);
    }

    return null;
  }

}
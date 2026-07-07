import 'package:Saller/core/constant/routes.dart';
import 'package:Saller/core/services/Services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homescreencontroller extends GetxController {
  logout();
}

class HomescreencontrollerImp extends Homescreencontroller {
  Myservices myServices = Get.find();

  @override
  logout() {
    Get.defaultDialog(
      title: "تنبيه".tr,
      middleText: "هل أنت متأكد من تسجيل الخروج؟".tr,
      onConfirm: () {
        myServices.sharedPreferences!.clear();
        Get.offAllNamed(Approutes.Login);
      },
      onCancel: () {},
      textConfirm: "نعم".tr,
      textCancel: "لا".tr,
    );
  }

}

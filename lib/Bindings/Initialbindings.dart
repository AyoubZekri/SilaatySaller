import 'package:Saller/controller/StartpageContrller.dart';
import 'package:Saller/controller/auth/Logincontroller.dart';
import 'package:Saller/core/class/Crud.dart';
import 'package:Saller/core/services/Services.dart';
import 'package:get/get.dart';


class Initialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(Myservices());
    Get.lazyPut(() => Logincontroller(), fenix: true);
    Get.lazyPut(() => Startpagecontrller(), fenix: true);
    // Get.lazyPut(() => HomescreencontrollerImp());
  }
}

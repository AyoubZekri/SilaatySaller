import 'package:Saller/core/class/Statusrequest.dart';
import 'package:Saller/core/functions/handlingdatacontroller.dart';
import 'package:Saller/core/services/Services.dart';
import 'package:Saller/data/datasource/Remote/Categoris_data.dart';
import 'package:Saller/data/model/Categoris_model.dart';
import 'package:get/get.dart';

class Addcategoriscontroller extends GetxController {
  CategorisData categorisData = CategorisData(Get.find());

  Myservices myservices = Get.find();

  List<Catdata> categories = [];
  Statusrequest statusrequest = Statusrequest.none;

  getCategoris() async {
    var response = await categorisData.viewdata();
    print("============================================== $response");
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success && response["status"] == 1) {
      final model = Categoris_Model.fromJson(response);
      categories = model.data?.catdata ?? [];
    } else {
      statusrequest = Statusrequest.failure;
    }
    update();
  }
}

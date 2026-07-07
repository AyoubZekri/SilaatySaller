import 'package:Saller/LinkApi.dart';
import 'package:Saller/core/class/Statusrequest.dart';
import 'package:Saller/core/functions/handlingdatacontroller.dart';
import 'package:Saller/data/datasource/Remote/Auth/logen_data.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

import '../core/services/Services.dart';

class Startpagecontrller extends GetxController {
  LoginData logenData = LoginData(Get.find());
  // List data = [];
  late int Status;
  Myservices myServices = Get.find();

  String date_experiment = "";

  Statusrequest statusrequest = Statusrequest.none;

  getUser() async {
    statusrequest = Statusrequest.loadeng;
    update();
    var response = await logenData.getUser();
    print("==============================$response");
    statusrequest = handlingData(response);
    if (statusrequest == Statusrequest.success) {
      if (response["status"] == 1) {
        var sellerData = response["data"]["data"];
        var parentData = sellerData["parent"];
        
        Status = parentData['Status'];
        
        String imageUrl = parentData["logo_stor"] ?? "";
        String fileName = imageUrl.split("/").last;
        String localPath = "${Applink.image}/storage/$imageUrl";
        print("==================================$localPath");

        print("==================================$fileName");
        if (imageUrl.isNotEmpty) {
          localPath = await downloadAndCacheImage(localPath, fileName);
        }
        print("==================================$localPath");
        
        if (parentData["logo_stor"] != null) {
          myServices.sharedPreferences!.setString("logo_stor", localPath);
        }

        myServices.sharedPreferences!.setInt("id", parentData['id']);
        myServices.sharedPreferences!.setInt("sellerid", sellerData['id']);
        myServices.sharedPreferences!.setString("email", sellerData['email']);
        myServices.sharedPreferences!.setString("name", sellerData["name"]);
        myServices.sharedPreferences!.setString("phone", parentData["phone_number"]);
        myServices.sharedPreferences!.setString("family_name", parentData["family_name"]);
        myServices.sharedPreferences!.setInt("user_notify_status", parentData["user_notify_status"]);
        
        if (parentData["adresse"] != null) {
          myServices.sharedPreferences!.setString("adresse", parentData["adresse"]);
        }
        myServices.sharedPreferences!.setInt("Status", parentData["Status"]);
        
        print("==================================${parentData["date_experiment"]}");
        if (parentData["date_experiment"] != null) {
          myServices.sharedPreferences!.setString("date_experiment", parentData["date_experiment"]);
          date_experiment = parentData["date_experiment"];
        }
      }
    }

    update();
  }

  Future<String> downloadAndCacheImage(String imageUrl, String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$fileName";

      File file = File(filePath);

      await file.parent.create(recursive: true);

      if (await file.exists()) {
        return filePath;
      }

      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      }

      return "";
    } catch (e) {
      return "";
    }
  }
}

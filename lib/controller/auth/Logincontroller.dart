import 'package:Saller/core/class/Statusrequest.dart';
import 'package:Saller/core/constant/routes.dart';
import 'package:Saller/core/functions/Snacpar.dart';
import 'package:Saller/core/functions/handlingdatacontroller.dart';
import 'package:Saller/core/services/Services.dart';
import 'package:Saller/data/datasource/Remote/Auth/logen_data.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:Saller/LinkApi.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController Email;
  late TextEditingController Password;
  bool issobscureText = true;
  showPassword() {
    issobscureText = issobscureText == true ? false : true;
    update();
  }

  Myservices myServices = Get.find();
  LoginData logenData = LoginData(Get.find());
  List data = [];
  Statusrequest statusrequest = Statusrequest.none;

  Login() async {
    var formData = formstate.currentState;
    if (formData!.validate()) {
      statusrequest = Statusrequest.loadeng;
      update();
      var response = await logenData.postdata(Password.text, Email.text);
      if (response == Statusrequest.serverfailure) {
        showSnackbar("error".tr, "noInternet".tr, Colors.red);
      }
      statusrequest = handlingData(response);
      print("=============================== Controller $response ");
      if (statusrequest == Statusrequest.success) {
        if (response["status"] == 1) {
          print(response["data"]["token"]);
          myServices.sharedPreferences!
              .setInt("id", response['data']["sellerData"]["parent"]['id']);
          myServices.sharedPreferences!
              .setInt("sellerid", response['data']["sellerData"]['id']);

          myServices.sharedPreferences!
              .setString("email", response['data']["sellerData"]['email']);
          myServices.sharedPreferences!
              .setString("name", response["data"]["sellerData"]["name"]);
          myServices.sharedPreferences!.setString("phone",
              response["data"]["sellerData"]["parent"]["phone_number"]);
          myServices.sharedPreferences!.setString("family_name",
              response["data"]["sellerData"]["parent"]["family_name"]);
          myServices.sharedPreferences!.setInt("user_notify_status",
              response["data"]["sellerData"]["parent"]["user_notify_status"]);
          if (response["data"]["sellerData"]["parent"]["adresse"] != null) {
            myServices.sharedPreferences!.setString(
                "adresse", response["data"]["sellerData"]["parent"]["adresse"]);
          }

          String imageUrl = response["data"]["sellerData"]["parent"]["logo_stor"] ?? "";
          if (imageUrl.isNotEmpty) {
            String fileName = imageUrl.split("/").last;
            String localPath = "${Applink.image}/storage/$imageUrl";
            localPath = await downloadAndCacheImage(localPath, fileName);
            if (localPath.isNotEmpty) {
              myServices.sharedPreferences!.setString("logo_stor", localPath);
            }
          }

          myServices.sharedPreferences!.setInt(
              "Status", response["data"]["sellerData"]["parent"]["Status"]);
          if (response["data"]["sellerData"]["parent"]["date_experiment"] !=
              null) {
            myServices.sharedPreferences!.setString("date_experiment",
                response["data"]["sellerData"]["parent"]["date_experiment"]);
          }
          myServices.sharedPreferences!
              .setString("token", response["data"]["token"]);
          myServices.sharedPreferences!.setString("step", "2");
          DateTime? experimentDate;

          final experimentDateStr =
              response["data"]["sellerData"]["parent"]["date_experiment"];

          if (experimentDateStr != null &&
              experimentDateStr.toString().isNotEmpty) {
            try {
              experimentDate = DateTime.parse(experimentDateStr);
            } catch (e) {
              experimentDate = null;
            }
          }

          final today = DateTime.now();
          final status = response['data']["sellerData"]["parent"]['Status'];

          if (status == 0) {
            Get.offAllNamed(Approutes.VerifiycodeSignUp, arguments: {
              "email": Email.text,
            });
          } else if (status == 3 || status == 5) {
            Get.offAllNamed(Approutes.upgradeRequiredPage);
          } else if (status == 6) {
            Get.offAllNamed(Approutes.HomeScreen, arguments: {"fromlogin": 1});
          } else if (experimentDate != null &&
              today.isBefore(experimentDate) &&
              (status == 2 || status == 4)) {
            Get.offAllNamed(Approutes.HomeScreen, arguments: {"fromlogin": 1});
          } else {
            Get.offAllNamed(Approutes.activationExpiredPage);
          }
        }
      } else {
        showSnackbar("Warning".tr, "email_password_wrong".tr, Colors.orange);
      }
      update();
    } else {
      print("Not valid");
    }
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   String? token = value;
    //   print("token:$token");
    // });

    Email = TextEditingController();
    Password = TextEditingController();
    // getUser();
    super.onInit();
  }

  @override
  void dispose() {
    Email.dispose();
    Password.dispose();
    super.dispose();
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

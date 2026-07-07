import 'package:Saller/core/constant/Colorapp.dart';
import 'package:Saller/core/constant/routes.dart';
import 'package:Saller/core/services/Services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpgradeRequiredPage extends StatelessWidget {
  const UpgradeRequiredPage({super.key});

  @override
  Widget build(BuildContext context) {
    Myservices myservices = Get.find();

    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: Column(
          children: [
            // Alert Icon Section
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: AppColor.backgroundcolor.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: AppColor.backgroundcolor.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColor.backgroundcolor.withOpacity(0.4),
                            width: 4),
                      ),
                      child: Icon(
                        Icons.upgrade,
                        size: 56,
                        color: AppColor.backgroundcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main Content Container (White Bottom Sheet)
            Container(
              width: double.infinity,
              height: Get.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Drag Indicator
                    Container(
                      width: 48,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(3),
                      ),
                      margin: const EdgeInsets.only(bottom: 24),
                    ),

                    Text(
                      "ترقية الحساب مطلوبة".tr,
                      style: TextStyle(
                        color: Color(0xFF221610),
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "يجب ترقية الحساب للعمل في حساب البائع. يرجى مراجعة مالك المتجر لتفعيل هذه الميزة.".tr,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),
                    
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Colors.redAccent.withOpacity(0.3),
                            width: 2),
                        minimumSize: const Size.fromHeight(56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        myservices.sharedPreferences?.clear();
                        Get.offAllNamed(Approutes.Login);
                      },
                      icon: const Icon(Icons.logout, color: Colors.redAccent),
                      label: Text(
                        "تسجيل الخروج".tr,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

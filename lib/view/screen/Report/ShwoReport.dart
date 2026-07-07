import 'package:Saller/controller/Report/Shworeportcontroller.dart';
import 'package:Saller/core/class/handlingview.dart';
import 'package:Saller/core/constant/Colorapp.dart';
import 'package:Saller/core/constant/imageassets.DART';
import 'package:Saller/view/widget/Iformationitem/CustemBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Shworeport extends StatefulWidget {
  const Shworeport({super.key});

  @override
  State<Shworeport> createState() => _ShworeportState();
}

class _ShworeportState extends State<Shworeport> {
  Shworeportcontroller controller = Get.put(Shworeportcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text('Reporting content'.tr,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.backgroundcolor, fontSize: 24)),
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(
          color: AppColor.backgroundcolor,
        ),
      ),
      body: GetBuilder<Shworeportcontroller>(builder: (controller) {
        if (controller.report.isEmpty) {
          return Center(
            child: Lottie.asset(Appimageassets.loading, width: 150),
          );
        }
        return Handlingview(
          statusrequest: controller.statusrequest,
          widget: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custembody(
                      body: controller.report[0].report ?? "",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Custembody(
                        body:
                            "${'Date'.tr} :${controller.report[0].createdAt?.substring(0, 10) ?? ""}")
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

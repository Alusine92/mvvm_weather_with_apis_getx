import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_with_apis_getx/Resources/Images/image_assets.dart';
import 'package:mvvm_weather_with_apis_getx/View/Home/Components/small_container.dart';
import 'package:mvvm_weather_with_apis_getx/ViewModel/Controllers/home_controller.dart';
class ContainerList extends StatelessWidget {
   ContainerList({super.key});

   final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() => SmallContainer(text: '${controller.getCloudOver()}%', image: ImageAssets.heavyRain, color: Colors.black54, textColor: Colors.white)),
          Obx(() => SmallContainer(text: '${controller.getWindSpeed()}km/h', image: ImageAssets.wind, color: Colors.black54, textColor: Colors.white)),
          Obx(() => SmallContainer(text: '${controller.getHumidity()}%', image: ImageAssets.sun, color: Colors.black54, textColor: Colors.white)),
        ],
      ),
    );
  }
}

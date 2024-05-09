import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_with_apis_getx/Resources/Images/image_assets.dart';
import 'package:mvvm_weather_with_apis_getx/Utilities/utilities.dart';
import 'package:mvvm_weather_with_apis_getx/ViewModel/Controllers/days_controller.dart';
import 'package:mvvm_weather_with_apis_getx/ViewModel/Controllers/home_controller.dart';

import 'small_container_list.dart';
class CenterCard extends StatelessWidget {
   CenterCard({super.key});

   final homeController = Get.put(HomeController());
   final controller = Get.put(DaysController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 440,
      width: size.width,
      margin: const EdgeInsets.only(top: 80),
      child: Stack(
        children: [
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: Container(
              height: 350,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withOpacity(.7),
                    Colors.blue.withOpacity(.5),
                    Colors.blue.withOpacity(.7),
                  ]
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShaderMask(
                              shaderCallback: (Rect bounds)
                              {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    Colors.white.withOpacity(.5)
                                  ],
                                ).createShader(bounds);
                              },
                              child: Obx(() => Text(
                                '${controller.day.value.temp.toString()}\u00B0',
                                style: const TextStyle(
                                  fontSize: 80,
                                  height: 0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                            Obx(() => Text(
                              'Feel like ${controller.day.value.feelslike}',
                              style: const TextStyle(
                                height: 0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                          ],
                        ),
                      ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Obx(() => Text(
                            controller.day.value.conditions,
                            style: const TextStyle(
                              height: 0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            Utilities.currentTime(),
                            style: TextStyle(
                              height: 0,
                              color: Colors.white.withOpacity(.8),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds)
                      {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.5),
                          ],
                        ).createShader(bounds);
                      },
                      child: Image.asset(
                        ImageAssets.windWave,
                        height: 130,
                        width: 150,//200
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    child: SizedBox(
                      width: size.width-60,
                      child: SmallContainerList(),
                    ),
                  ),
                  Positioned(
                    left: 5, //30
                    top: 1,
                    child: Obx(() => Image.asset(
                      controller.getImage(controller.currentDay.value,), height: 130, width: 130,//190/190
                    ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_weather_with_apis_getx/Resources/Colors/colors.dart';
import 'package:mvvm_weather_with_apis_getx/View/Next-Days/components/app_bar.dart';
import 'package:mvvm_weather_with_apis_getx/View/Next-Days/components/bottom_list.dart';
import 'package:mvvm_weather_with_apis_getx/View/Next-Days/components/days_list.dart';
import 'package:mvvm_weather_with_apis_getx/ViewModel/Controllers/days_controller.dart';
import 'package:mvvm_weather_with_apis_getx/ViewModel/Controllers/home_controller.dart';

import 'components/center_card.dart';
class NextDays extends StatelessWidget {

  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());

   NextDays({super.key});


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
                   Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomAppBarz(),
                      const SizedBox(
                        height: 20,
                      ),
                      DaysList(),
                    ],
                  ),
              Positioned(
                bottom: 1,
                child: Container(
                  height: size.height /1.9,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                  ),
                ),
              ),
              BottomList(),
               Hero(
                tag: 'TAG',
                child: Material(color: Colors.transparent, child: CenterCard(),),
              )
              ],
                ),
              ),
          ),
        ),
      );
  }
}

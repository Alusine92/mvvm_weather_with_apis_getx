import 'package:get/instance_manager.dart';
import 'package:mvvm_weather_with_apis_getx/ViewModel/Controllers/home_controller.dart';

class SplashServices
{
  static void getApiData()
  {
    final controller = Get.put(HomeController());
    controller.getData();
  }
}
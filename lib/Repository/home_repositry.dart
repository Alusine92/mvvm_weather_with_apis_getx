import 'package:mvvm_weather_with_apis_getx/Data/Network/api_services.dart';

import '../Resources/AppUrl/app_url.dart';

class HomeRepositry
{
  static Future<dynamic> hitApi() async
  {
    var response = await ApiServices().getApi(AppUrl.url);
    return response;
  }
}
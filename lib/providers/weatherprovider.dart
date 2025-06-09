import 'package:flutter/material.dart';
import 'package:try_apps/models/weathermodel.dart';
import 'package:try_apps/services/weatherservice.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? weatherModel;
  Future<void> fetchdata() async{
    weatherModel = await WeatherService.getdata();
    notifyListeners();
  }
}
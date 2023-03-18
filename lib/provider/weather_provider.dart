import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  List<WeatherModel>? _weartherList;
  String? _cityname;
  bool error=false;
  set weartherdata(List<WeatherModel>? weatherdata) {
    _weartherList = weatherdata;
    notifyListeners();
  }

  set cityname(String cityname) {
    _cityname = cityname;
    notifyListeners();
  }

  List<WeatherModel>? get weartherdata => _weartherList;
  String get cityname => _cityname!;
}

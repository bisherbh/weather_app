import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';

import '../model/weather_model.dart';

class WeatherService {
  String BaseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '4d8611b28dba45abacd174551231203';

  bool error = false;
  Future<List<WeatherModel>> getdata(String cityname) async {
    var response = await http.get(Uri.parse(
        '$BaseUrl/forecast.json?key=$apiKey&q=$cityname&days=12&aqi=no&alerts=no'));
    if (response.statusCode == 200) {
      var Data = jsonDecode(response.body)['forecast']['forecastday'];
      List<WeatherModel>? W_data = [];

      for (var day in Data) {
        W_data.add(WeatherModel.fromJson(day));
      }
      return W_data;

      // int coun = 0;
      // for (var element in W_data) {
      //   print("Day:");
      //   for (var hour in element.hours!) {
      //     print(hour.hour_temp_c);
      //   }
      // }
    } else {
      error = true;
     

      var data = jsonDecode(response.body);

      throw Exception(data['error']['message']);
    }
  }
}

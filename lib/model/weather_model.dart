class WeatherModel {
  DateTime? day_date;
  double? maxtemp_c;
  double? mintemp_c;
  double? avghumidity;
  int? daily_chance_of_rain;
  double? uv;
  double? maxwind_kph;
  String? weatherStateName;
  String? day_icon;
  List<Hours>? hours;

  WeatherModel(
      {this.day_date,
      this.maxtemp_c,
      this.mintemp_c,
      this.avghumidity,
      this.daily_chance_of_rain,
      this.uv,
      this.maxwind_kph,
      this.weatherStateName,
      this.day_icon,
      this.hours});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> hourList = json['hour'];
    List<Hours> Hours_day = [];
    for (var hour in hourList) {
      Hours_day.add(Hours.fromJson(hour));
    }
    return WeatherModel(
      day_date: DateTime.parse(json['date']),
      maxtemp_c: json['day']['maxtemp_c'],
      mintemp_c: json['day']['mintemp_c'],
      avghumidity: json['day']['avghumidity'],
      daily_chance_of_rain: json['day']['daily_chance_of_rain'],
      uv: json['day']['uv'],
      maxwind_kph: json['day']['maxwind_kph'],
      weatherStateName: json['day']['condition']['text'],
      day_icon: json['day']['condition']['icon'],
      hours: Hours_day,
    );
  }
}

class Hours {
  DateTime? time;
  double? hour_temp_c;
  String? hour_icon;
  Hours({this.time, this.hour_temp_c, this.hour_icon});
  factory Hours.fromJson(dynamic json) {
    return Hours(
      time: DateTime.parse(json['time']),
      hour_icon: json['condition']['icon'],
      hour_temp_c: json['temp_c'],
    );
  }
}

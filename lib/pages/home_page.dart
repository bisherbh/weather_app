import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/Search_opage.dart';
import 'package:weather_app/provider/weather_provider.dart';

import '../model/weather_model.dart';
import '../services/weather_service.dart';

class Homepage extends StatelessWidget {
  WeatherService Lol = WeatherService();
  // Future<List<WeatherModel>> _refreshProducts(BuildContext context) async {
  //   return Lol.getdata('damascus');
  // }

// List<WeatherModel>? Data;
  List<WeatherModel>? weather_list;
  WeatherService? service;
  Map<int, String> weekdayName = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };
  Map<int, String> weekdayName2 = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };
  Map<int, String> monthName = {
    1: "January",
    2: "February",
    3: "March",
    4: "April",
    5: "May",
    6: "June",
    7: "July",
    8: "August",
    9: "September",
    10: "October",
    11: "November",
    12: "December"
  };

  @override
  Widget build(BuildContext context) {
    weather_list =
        Provider.of<WeatherProvider>(context, listen: true).weartherdata;
// bool weather_list =true;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff3389f1), //or set color with: Color(0xFF0000FF)
    ));
    print(weather_list);
    return weather_list != null
        ? Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xff3389f1),
                  Color(0xff3389f1),
                  Color.fromARGB(255, 12, 116, 244),
                  //  Color.fromARGB(43, 51, 137, 241),

                  Color.fromARGB(255, 201, 214, 231),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      child: Stack(
                        children: [
                          Positioned(
                              left: MediaQuery.of(context).size.width * 0.24,
                              top: -30,
                              child: Selector<WeatherProvider, String>(
                                selector: (context, wetherdata) =>
                                    wetherdata.weartherdata![0].day_icon!,
                                builder: (context, image, _) {
                                  return Image.network(
                                    'https:$image',
                                    fit: BoxFit.fill,
                                    width: 400,
                                  );
                                },
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          top: 14.0, left: 20, bottom: 5),
                                      child:
                                          Selector<WeatherProvider, DateTime>(
                                        selector: (context, wetherdata) =>
                                            wetherdata
                                                .weartherdata![0].day_date!,
                                        builder: (context, date, _) {
                                          return Text(
                                            '${date.day} ${monthName[date.month]},${weekdayName[date.weekday]}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          );
                                        },
                                      )),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 2.0,
                                              left: 20,
                                              bottom: 5,
                                              right: 2),
                                          child:
                                              Selector<WeatherProvider, String>(
                                            selector: (context, wetherdata) =>
                                                wetherdata.cityname,
                                            builder: (context, cityname, _) {
                                              return Text(
                                                '$cityname',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              );
                                            },
                                          )),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (_) {
                                            return SearchPage();
                                          }));
                                        },
                                        icon: Icon(
                                          Icons.arrow_outward,
                                          size: 20,
                                          color: Color.fromARGB(
                                              202, 150, 184, 235),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return SearchPage();
                                    }));
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    size: 37,
                                    color: Color.fromARGB(201, 252, 253, 253),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 26.0),
                            child: Selector<WeatherProvider, double>(
                              selector: (context, wetherdata) =>
                                  wetherdata.weartherdata![0].maxtemp_c!,
                              builder: (context, maxtemp_c, _) {
                                return Text(
                                  '${maxtemp_c.toInt()}°C',
                                  style: TextStyle(
                                    fontSize: 100,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            )),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Min Temp',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                            Selector<WeatherProvider, double>(
                              selector: (context, wetherdata) =>
                                  wetherdata.weartherdata![0].mintemp_c!,
                              builder: (context, mintemp_c, _) {
                                return Text(
                                  '${mintemp_c.toInt()}°C',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Table(
                            border: TableBorder.symmetric(
                                inside: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 233, 235, 237))),
                            children: [
                              TableRow(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Humidity',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 255, 252, 246),
                                                fontSize: 19)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Selector<WeatherProvider,
                                                double>(
                                              selector: (context, wetherdata) =>
                                                  wetherdata.weartherdata![0]
                                                      .avghumidity!,
                                              builder:
                                                  (context, avghumidity, _) {
                                                return Text(
                                                    '${avghumidity.toInt()}%',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            217, 255, 252, 246),
                                                        fontSize: 19));
                                              },
                                            )),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('UV index',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 255, 252, 246),
                                                fontSize: 19)),
                                        Selector<WeatherProvider, double>(
                                          selector: (context, wetherdata) =>
                                              wetherdata.weartherdata![0].uv!,
                                          builder: (context, uv, _) {
                                            return Text('${uv.toInt()} /10',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        217, 255, 252, 246),
                                                    fontSize: 19));
                                          },
                                        )
                                      ],
                                    )),
                              ]),
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Rain',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 255, 252, 246),
                                                fontSize: 19)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child:
                                                Selector<WeatherProvider, int>(
                                              selector: (context, wetherdata) =>
                                                  wetherdata.weartherdata![0]
                                                      .daily_chance_of_rain!,
                                              builder: (context,
                                                  daily_chance_of_rain, _) {
                                                return Text(
                                                    '${daily_chance_of_rain.toInt()} %',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            217, 255, 252, 246),
                                                        fontSize: 19));
                                              },
                                            )),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Wind',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    217, 255, 252, 246),
                                                fontSize: 19)),
                                        Selector<WeatherProvider, double>(
                                          selector: (context, wetherdata) =>
                                              wetherdata.weartherdata![0]
                                                  .maxwind_kph!,
                                          builder: (context, maxwind_kph, _) {
                                            return Text(
                                                '${maxwind_kph.toInt()} km/h',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        217, 255, 252, 246),
                                                    fontSize: 19));
                                          },
                                        )
                                      ],
                                    )),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 29.0, left: 3),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    bottomLeft: Radius.circular(40)),
                                color: Color.fromARGB(200, 255, 252, 246)),
                            height: 90,
                            child: Selector<WeatherProvider, List<Hours>>(
                              selector: (context, wetherdata) =>
                                  wetherdata.weartherdata![0].hours!,
                              builder: (context, hours, _) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hours.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.network(
                                          'https:${hours[index].hour_icon}',
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${hours[index].hour_temp_c!.toInt()}°C',
                                              style: TextStyle(
                                                  color: Color(0xff4a6b94),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              '${hours[index].time!.hour}:00',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 166, 167, 168),
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          indent: 20,
                                          endIndent: 20,
                                          thickness: 2,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(
                                flex: 1,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tomorrow',
                                    style: TextStyle(
                                        color: Color(0xff4a6b94),
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Selector<WeatherProvider, DateTime>(
                                    selector: (context, wetherdata) =>
                                        wetherdata.weartherdata![1].day_date!,
                                    builder: (context, date, _) {
                                      return Text(
                                        '${date.day} ${monthName[date.month]},${weekdayName[date.weekday]}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 185, 187, 188),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Selector<WeatherProvider, String>(
                                selector: (context, wetherdata) =>
                                    wetherdata.weartherdata![1].day_icon!,
                                builder: (context, image, _) {
                                  return Image.network(
                                    'https:$image',
                                    fit: BoxFit.fill,
                                    width: 119,
                                  );
                                },
                              ),
                              Spacer(
                                flex: 2,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Selector<WeatherProvider, double>(
                                        selector: (context, wetherdata) =>
                                            wetherdata
                                                .weartherdata![1].maxtemp_c!,
                                        builder: (context, maxtemp_c, _) {
                                          return Text(
                                            '${maxtemp_c.toInt()}',
                                            style: TextStyle(
                                                color: Color(0xff4a6b94),
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4.0),
                                        child: Selector<WeatherProvider, double>(
                                          selector: (context, wetherdata) =>
                                              wetherdata
                                                  .weartherdata![1].mintemp_c!,
                                          builder: (context, mintemp_c, _) {
                                            return Text(
                                              '${mintemp_c.toInt()}°C',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 84, 126, 174),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Selector<WeatherProvider, String>(
                                    selector: (context, wetherdata) => wetherdata
                                        .weartherdata![1].weatherStateName!,
                                    builder: (context, weatherStateName, _) {
                                      return Text(

                                        '$weatherStateName',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 185, 187, 188),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold));
                                    },
                                  ),
                                ],
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // Color.fromARGB(255, 143, 141, 144),
                    //color: Color(0xff4a6b94),
                    //  color: Color.fromARGB(255, 191, 195, 196)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Table(
                            border: TableBorder.symmetric(
                                inside: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 191, 195, 196))),
                            children: [
                              TableRow(children: [
                                Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Humidity',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 191, 195, 196),
                                                fontSize: 19)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: Selector<WeatherProvider,
                                                double>(
                                              selector: (context, wetherdata) =>
                                                  wetherdata.weartherdata![1]
                                                      .avghumidity!,
                                              builder:
                                                  (context, avghumidity, _) {
                                                return Text(
                                                    '${avghumidity.toInt()}%',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff4a6b94),
                                                        fontSize: 19));
                                              },
                                            )),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('UV index',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 191, 195, 196),
                                                fontSize: 19)),
                                        Selector<WeatherProvider, double>(
                                          selector: (context, wetherdata) =>
                                              wetherdata.weartherdata![1].uv!,
                                          builder: (context, uv, _) {
                                            return Text('${uv.toInt()} /10',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff4a6b94),
                                                    fontSize: 19));
                                          },
                                        )
                                      ],
                                    )),
                              ]),
                              TableRow(children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Rain',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 191, 195, 196),
                                                fontSize: 19)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child:
                                                Selector<WeatherProvider, int>(
                                              selector: (context, wetherdata) =>
                                                  wetherdata.weartherdata![1]
                                                      .daily_chance_of_rain!,
                                              builder: (context,
                                                  daily_chance_of_rain, _) {
                                                return Text(
                                                    '${daily_chance_of_rain.toInt()} %',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff4a6b94),
                                                        fontSize: 19));
                                              },
                                            )),
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Wind',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 191, 195, 196),
                                                fontSize: 19)),
                                        Selector<WeatherProvider, double>(
                                          selector: (context, wetherdata) =>
                                              wetherdata.weartherdata![1]
                                                  .maxwind_kph!,
                                          builder: (context, maxwind_kph, _) {
                                            return Text(
                                                '${maxwind_kph.toInt()} km/h',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xff4a6b94),
                                                    fontSize: 19));
                                          },
                                        )
                                      ],
                                    )),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "10 days forcast",
                              style: TextStyle(
                                  color: Color(0xff4a6b94),
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Selector<WeatherProvider, List<WeatherModel>>(
                            selector: (context, wetherdata) =>
                                wetherdata.weartherdata!,
                            builder: (context, weartherdata, _) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: ((weartherdata.length)),
                                itemBuilder: (context, index) {
                                  index += 2;
                                  return index != 12
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Text(
                                                          '${weartherdata[index].day_date!.day} ${monthName[weartherdata[index].day_date!.month]},',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff4a6b94),
                                                              fontSize: 26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                            '${weekdayName2[weartherdata[index].day_date!.weekday]}',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        185,
                                                                        187,
                                                                        188),
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Row(
                                                      children: [
                                                        Image.network(
                                                          'https:${weartherdata[index].day_icon}',
                                                          fit: BoxFit.cover,
                                                          width: 55,
                                                        ),
                                                        Text(
                                                          '${weartherdata[index].maxtemp_c!.toInt()}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff4a6b94),
                                                              fontSize: 26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4.0),
                                                          child: Text(
                                                            '${weartherdata[index].mintemp_c!.toInt()}°C',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        185,
                                                                        187,
                                                                        188),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.right,
                                                        '${weartherdata[index].weatherStateName}',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff4a6b94),
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: Divider(
                                                  thickness: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : null;
                                },
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
          )
        : Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color(0xff3389f1),
                    Color(0xff3389f1),
                    Color.fromARGB(255, 12, 116, 244),
                    Color.fromARGB(255, 12, 116, 244),
                    Color.fromARGB(255, 201, 214, 231),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Search For Weather By enter your city name",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return SearchPage();
                            }));
                          },
                          icon: Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ))
                    ],
                  )),
            )),
          );
  }
}

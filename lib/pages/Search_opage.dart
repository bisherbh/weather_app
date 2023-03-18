import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';

import '../provider/weather_provider.dart';
import '../services/weather_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? City;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onSubmitted: (data) async {
              City = data;
              WeatherService weather_service = WeatherService();
              try {
                List<WeatherModel> weather_model =
                    await weather_service.getdata(City!);
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .weartherdata = weather_model;
                Provider.of<WeatherProvider>(context, listen: false).cityname =
                    City!;
                print(Provider.of<WeatherProvider>(context, listen: false)
                    .weartherdata![0]
                    .weatherStateName);

                Navigator.pop(context);
              } catch (e) {

             ScaffoldMessenger.of(context).showSnackBar(
   SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
duration: Duration(seconds: 4),
              backgroundColor: Colors.transparent,
margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.6 ),
              content: AwesomeSnackbarContent(
                title: 'Sorry!',
                message:
                    'Enter City name correctly OR check your Internet!',
color: Colors.blue,
                contentType: ContentType.failure,
              ),
            ),
);

              }
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(30),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
              hintText: "Enter city name",
              label: Text("Search"),
            ),
          ),
        ),
      ),
    );
  }
}

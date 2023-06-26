import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(weatherApp());
}

class weatherApp extends StatelessWidget {
  const weatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Weather App",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: appBody(),
    );
  }
}

class WeatherData {
  final String locationName;
  final double temperatureCelsius;
  final String conditionText;
  final String conditionIconUrl;

  WeatherData({
    required this.locationName,
    required this.temperatureCelsius,
    required this.conditionText,
    required this.conditionIconUrl,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      locationName: json['location']['name'],
      temperatureCelsius: json['current']['temp_c'],
      conditionText: json['current']['condition']['text'],
      conditionIconUrl: json['current']['condition']['icon'],
    );
  }
}

class appBody extends StatefulWidget {
  appBody({Key? key}) : super(key: key);

  @override
  _appBodyState createState() => _appBodyState();
}

class _appBodyState extends State<appBody> {
  String? weatherData;
  var location = "Dhaka";
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    try {
      var weather = await makeApiCall();
      setState(() {
        weatherData =
            '${weather.locationName}\nTemperature: ${weather.temperatureCelsius}°C\nCondition: ${weather.conditionText}';
      });
    } catch (e) {
      setState(() {
        weatherData = "Failed to load data. Please try again.";
      });
    }
  }

  Future<WeatherData> makeApiCall() async {
    var url = Uri.http('api.weatherapi.com', '/v1/current.json');
    var response = await http.post(url,
        body: {'key': '5a5c403fd9a843beb3260658230903', 'q': _controller.text});

    if (response.statusCode == 200) {
      Map<String, dynamic> wdata = json.decode(response.body);
      return WeatherData.fromJson(wdata);
    } else {
      throw Exception('Failed to load data');
    }
  }

  void updateWeatherData() {
    getWeatherData();
    setState(() {
      location = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Weather app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Enter city name",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(weatherData ?? "Loading..."),
            ),
            TextButton.icon(
              onPressed: updateWeatherData,
              label: Text("Search"),
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}

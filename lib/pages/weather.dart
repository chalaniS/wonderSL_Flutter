// // import 'model.dart';
// // import 'package:dio/dio.dart';
// // import 'dart:convert';

// // class WeatherApiClient(

// //   Future<WeatherModel> request,() async{
// //     String url = "";
// //     Response  response = await Dio().get(url);
// //     final parsedData = jsonDecode{response.toStrings() };
// //     final weather = WeatherModel.fromJson(parsedData);
// //     return weather;
// //   }
// // );

// import 'weather_model.dart';
// import 'package:dio/dio.dart';

// class WeatherApiClient {
//   final Dio _dio = Dio();
//   final String baseUrl = "https://example.com"; // Replace with your API URL

//   Future<WeatherModel> fetchWeather() async {
//     try {
//       final response = await _dio.get(baseUrl);
//       if (response.statusCode == 200) {
//         final parsedData = response.data;
//         final weather = WeatherModel.fromJson(parsedData);
//         return weather;
//       } else {
//         throw Exception("Failed to load weather data");
//       }
//     } catch (e) {
//       throw Exception("Error: $e");
//     }
//   }

//   request() {}
// }

import 'package:flutter/material.dart';

class WeatherDetail extends StatefulWidget {
  const WeatherDetail({Key? key}) : super(key: key);

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';
import 'package:ydits_ssc/packages/weather/weatherJapanPrefectures.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/config.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/components/telop_label.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/components/telop_content_eqinfo.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/components/telop_content_weather.dart';

class HomePage extends StatefulWidget {
  final Logger logger;

  const HomePage({super.key, required this.logger});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final double _labelWidth = Config.labelWidth;
  final double _labelFontSize = Config.fontSize;
  final String _labelFontFamily = Config.fontFamily;
  final double _contentFontSize = Config.fontSize;
  final String _contentFontFamily = Config.fontFamily;
  final Color _labelBgColor = const Color.fromARGB(255, 31, 31, 31);
  final Color _labelFontColor = const Color.fromARGB(255, 223, 223, 223);
  final double _telopSpeed = Config.telopSpeed;
  String _labelText = Config.initialLabelText;
  String _contentText = Config.initialContentText;
  StatefulWidget _telopContent =
      const TelopContentEqinfo(text: "", fontSize: 0, speed: 0);
  late WeatherFactory _weatherFactory;

  @override
  void initState() {
    super.initState();
    initWeatherFactory();
    updateWeather();
    // updateEqinfo();
  }

  Future<void> initWeatherFactory() async {
    _weatherFactory = WeatherFactory(Config.openWeatherMapApiKey);
  }

  Future<void> updateWeather() async {
    await fetchWeatherData();
  }

  Future<void> updateEqinfo() async {
    await fetchEqinfoData();
  }

  Future<void> fetchWeatherData() async {
    widget.logger.info("fetchWeatherData");

    setState(() {
      _labelText = "現在の天気";
      _contentText = "";

      _telopContent = TelopContentWeather(
        text: _contentText,
        fontSize: _contentFontSize,
        fontFamily: _contentFontFamily,
        speed: _telopSpeed,
        labelWidth: _labelWidth,
      );
    });

    for (String prefecture in WeatherJapanPrefectures.list) {
      Weather weather =
          await _weatherFactory.currentWeatherByCityName(prefecture);
      setState(() {
        _contentText +=
            '$prefecture: ${weather.temperature?.celsius?.toStringAsFixed(1)}°C ${weather.weatherDescription} | ';
      });
    }
  }

  Future<void> fetchEqinfoData() async {
    final url = Uri.parse("https://api2.ydits.net/eew.json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        onFetchEqinfoSuccess(response);
        return;
      } else {
        onFetchEqinfoError(response);
        return;
      }
    } catch (error) {
      onFetchEqinfoError(error);
      return;
    }
  }

  Future<void> onFetchEqinfoSuccess(response) async {
    final data = json.decode(response.body);

    setState(() {
      _labelText = "地震情報";
      _contentText = data.toString();
      _telopContent = TelopContentEqinfo(
        text: _contentText,
        fontSize: _contentFontSize,
        speed: _telopSpeed,
      );
    });
  }

  Future<void> onFetchEqinfoError(stack) async {
    setState(() {
      _labelText = "エラー";
    });

    if (stack is http.Response) {
      setState(() {
        _contentText = "Failed to fetch data: ${stack.statusCode}";
      });
    } else if (stack is Exception) {
      setState(() {
        _contentText = "Failed to fetch data: $stack";
      });
    } else {
      throw TypeError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            TelopLabel(
              width: _labelWidth,
              text: _labelText,
              bgColor: _labelBgColor,
              fontColor: _labelFontColor,
              fontSize: _labelFontSize,
              fontFamily: _labelFontFamily,
            ),
            _telopContent,
          ],
        ),
      ),
    );
  }
}

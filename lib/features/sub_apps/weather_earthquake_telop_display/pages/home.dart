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
import 'package:http/http.dart';
import 'package:weather/weather.dart';

import 'package:ydits_ssc/core/resources/japan_prefectures.dart';
import 'package:ydits_ssc/features/sub_apps/weather_earthquake_telop_display/config.dart';
import 'package:ydits_ssc/features/sub_apps/weather_earthquake_telop_display/components/telop_label.dart';
import 'package:ydits_ssc/features/sub_apps/weather_earthquake_telop_display/components/telop_content_eqinfo.dart';
import 'package:ydits_ssc/features/sub_apps/weather_earthquake_telop_display/components/telop_content_weather.dart';

class WeatherEarthquakeTelopDisplayHomePage extends StatefulWidget {
  final Logger logger;
  final WeatherEarthquakeTelopDisplayConfig config;
  final WeatherEarthquakeTelopDisplayAppConfig appConfig;
  final WeatherEarthquakeTelopDisplayWindowConfig windowConfig;

  const WeatherEarthquakeTelopDisplayHomePage({
    super.key,
    required this.logger,
    required this.config,
    required this.appConfig,
    required this.windowConfig,
  });

  @override
  State<WeatherEarthquakeTelopDisplayHomePage> createState() => _HomePage();
}

class _HomePage extends State<WeatherEarthquakeTelopDisplayHomePage> {
  final Color _labelBgColor = const Color.fromARGB(255, 31, 31, 31);
  final Color _labelFontColor = const Color.fromARGB(255, 223, 223, 223);
  late final double _labelWidth;
  late final double _labelFontSize;
  late final String _labelFontFamily;
  late final double _contentFontSize;
  late final String _contentFontFamily;
  late final double _telopSpeed;

  late WeatherFactory _weatherFactory;
  late String _labelText;
  late String _contentText;

  StatefulWidget _telopContent = const TelopContentEqinfo(
    text: "",
    fontSize: 0,
    speed: 0,
  );

  @override
  void initState() {
    super.initState();
    _labelWidth = widget.config.labelWidth;
    _labelFontSize = widget.config.fontSize;
    _labelFontFamily = widget.config.fontFamily;
    _contentFontSize = widget.config.fontSize;
    _contentFontFamily = widget.config.fontFamily;
    _telopSpeed = widget.config.telopSpeed;
    _labelText = widget.config.initialLabelText;
    _contentText = widget.config.initialContentText;
    initWeatherFactory();
    updateWeather();
    // updateEqinfo();
  }

  Future<void> initWeatherFactory() async {
    _weatherFactory = WeatherFactory(widget.config.openWeatherMapApiKey);
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

    for (String prefecture in JapanPrefectures.stringList) {
      Weather weather = await _weatherFactory.currentWeatherByCityName(
        prefecture,
      );
      setState(() {
        _contentText +=
            '$prefecture: ${weather.temperature?.celsius?.toStringAsFixed(1)}°C ${weather.weatherDescription} | ';
      });
    }
  }

  Future<void> fetchEqinfoData() async {
    final url = Uri.parse("https://api2.ydits.net/eew.json");

    try {
      final response = await get(url);

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

    if (stack is Response) {
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

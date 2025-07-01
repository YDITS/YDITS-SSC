//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart';
import 'package:weather/weather.dart';
import 'package:ydits_ssc/features/telop/telop_content/notifier/telop_content_state_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_label/notifier/telop_label_state_notifier.dart';

import 'package:ydits_ssc/core/resources/japan_prefectures.dart';
// import 'package:ydits_ssc/core/components/telop/telop_content_eqinfo/telop_content_eqinfo_state_provider.dart';
import 'package:ydits_ssc/features/telop/telop_label/widget/telop_label.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/weather_earthquake_telop_display_config.dart';
import 'package:ydits_ssc/features/telop/telop_content/widget/telop_content.dart';

class WeatherEarthquakeTelopDisplayHomePage extends ConsumerStatefulWidget {
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
  ConsumerState<WeatherEarthquakeTelopDisplayHomePage> createState() => _HomePage();
}

class _HomePage extends ConsumerState<WeatherEarthquakeTelopDisplayHomePage> {
  late WeatherFactory _weatherFactory;

  @override
  void initState() {
    super.initState();
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
    ref.read(telopLabelStateProvider().notifier).setText("現在の天気");
    ref.read(telopContentStateProvider().notifier).setText("");

    String text = "";

    for (String prefecture in JapanPrefectures.stringList) {
      Weather weather = await _weatherFactory.currentWeatherByCityName(
        prefecture,
      );
      text += '$prefecture: ${weather.temperature?.celsius?.toStringAsFixed(1)}°C ${weather.weatherDescription} | ';
    }

    ref.read(telopContentStateProvider().notifier).setText(text);
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
    ref.read(telopLabelStateProvider().notifier).setText("地震情報");
    ref.read(telopContentStateProvider().notifier).setText(data.toString());
  }

  Future<void> onFetchEqinfoError(stack) async {
    ref.read(telopLabelStateProvider().notifier).setText("エラー");

    if (stack is Response) {
      ref.read(telopContentStateProvider().notifier).setText("Failed to fetch data: ${stack.statusCode.toString()}");
    } else if (stack is Exception) {
      ref.read(telopContentStateProvider().notifier).setText("Failed to fetch data: ${stack.toString()}");
    } else {
      throw Exception("Unhandled error at onFetchEqinfoError: ${stack.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          children: [
            TelopLabel(),
            Expanded(child: TelopContent()),
          ],
        ),
      ),
    );
  }
}

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

import 'package:ydits_ssc/core/providers/weather/notifier/weather_notifier.dart';
import 'package:ydits_ssc/core/providers/weather_timer/notifier/weather_timer_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_content/notifier/telop_content_state_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_label/notifier/telop_label_state_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_label/widget/telop_label.dart';
import 'package:ydits_ssc/features/telop/telop_content/widget/telop_content.dart';

class WeatherEarthquakeTelopDisplayHomePage extends ConsumerStatefulWidget {
  const WeatherEarthquakeTelopDisplayHomePage({super.key, this.logger});

  final Logger? logger;

  @override
  ConsumerState<WeatherEarthquakeTelopDisplayHomePage> createState() =>
      _WeatherEarthquakeTelopDisplayHomePageState();
}

class _WeatherEarthquakeTelopDisplayHomePageState
    extends ConsumerState<WeatherEarthquakeTelopDisplayHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(weatherTimerProvider.notifier).addListener(updateWeather);
    });
  }

  Future<void> updateWeather() async {
    widget.logger?.info("fetchWeatherData");
    final state = ref.watch(yditsSscWeatherProvider);
    ref.read(telopLabelStateProvider().notifier).setText("現在の天気");
    ref.read(telopContentStateProvider().notifier).setText(state.telopText);
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
      ref
          .read(telopContentStateProvider().notifier)
          .setText("Failed to fetch data: ${stack.statusCode.toString()}");
    } else if (stack is Exception) {
      ref
          .read(telopContentStateProvider().notifier)
          .setText("Failed to fetch data: ${stack.toString()}");
    } else {
      throw Exception(
        "Unhandled error at onFetchEqinfoError: ${stack.toString()}",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(children: [TelopLabel(), Expanded(child: TelopContent())]),
      ),
    );
  }
}

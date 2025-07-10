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
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'package:ydits_ssc/core/providers/weather/notifier/weather_notifier.dart';
import 'package:ydits_ssc/core/providers/weather_timer/notifier/weather_timer_notifier.dart';

import 'package:ydits_ssc/features/telop/telop_content/notifier/telop_content_state_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_content/widget/telop_content.dart';
import 'package:ydits_ssc/features/telop/telop_label/notifier/telop_label_state_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_label/widget/telop_label.dart';

/// The home page for the Weather and Earthquake Telop Display.
class WeatherEarthquakeTelopDisplayHomePage extends ConsumerStatefulWidget {
  const WeatherEarthquakeTelopDisplayHomePage({super.key, this.logger});

  /// An optional logger for logging events.
  final Logger? logger;

  @override
  ConsumerState<WeatherEarthquakeTelopDisplayHomePage> createState() =>
      _WeatherEarthquakeTelopDisplayHomePageState();
}

/// The private state class for the Weather and Earthquake Telop Display home page.
class _WeatherEarthquakeTelopDisplayHomePageState
    extends ConsumerState<WeatherEarthquakeTelopDisplayHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(weatherTimerProvider.notifier).addListener(_updateWeather);
    });
  }

  /// Updates the weather information in the telop.
  Future<void> _updateWeather() async {
    widget.logger?.info('Updating weather data...');
    final weatherState = ref.watch(yditsSscWeatherProvider);
    ref.read(telopLabelStateProvider.notifier).setText('現在の天気');
    ref.read(telopContentStateProvider.notifier).setText(weatherState.telopText);
  }

  /// Fetches earthquake information from the API.
  Future<void> _fetchEqInfoData() async {
    final url = Uri.parse('https://api2.ydits.net/vxse53');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        _onFetchEqInfoSuccess(response);
      } else {
        _onFetchEqInfoError(response);
      }
    } catch (error) {
      _onFetchEqInfoError(error);
    }
  }

  /// Handles a successful fetch of earthquake information.
  void _onFetchEqInfoSuccess(http.Response response) {
    final data = json.decode(response.body);
    ref.read(telopLabelStateProvider.notifier).setText("地震情報");
    ref.read(telopContentStateProvider.notifier).setText(data.toString());
  }

  /// Handles an error when fetching earthquake information.
  void _onFetchEqInfoError(dynamic error) {
    ref.read(telopLabelStateProvider.notifier).setText('エラー');

    if (error is http.Response) {
      ref
          .read(telopContentStateProvider.notifier)
          .setText('Failed to fetch data: ${error.statusCode}');
    } else {
      ref
          .read(telopContentStateProvider.notifier)
          .setText('Failed to fetch data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          children: [TelopLabel(), Expanded(child: TelopContent())],
        ),
      ),
    );
  }
}

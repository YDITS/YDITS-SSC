//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ydits_ssc/weather_earthquake_telop_display/config.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/components/telop_label.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/components/telop_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final double _labelWidth = Config.labelWidth;
  final double _labelFontSize = Config.fontSize;
  final double _contentFontSize = Config.fontSize;
  final Color _labelBgColor = const Color.fromARGB(255, 31, 31, 31);
  final Color _labelFontColor = const Color.fromARGB(255, 223, 223, 223);
  final double _telopSpeed = Config.telopSpeed;
  String _labelText = Config.initialLabelText;
  String _contentText = Config.initialContentText;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse("https://api2.ydits.net/eew.json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        onFetchSuccess(response);
        return;
      } else {
        onFetchError(response);
        return;
      }
    } catch (error) {
      onFetchError(error);
      return;
    }
  }

  Future<void> onFetchSuccess(response) async {
    final data = json.decode(response.body);

    setState(() {
      _labelText = "地震情報";
      // _contentText = data.toString();
      _contentText = "2024年12月9日 21時42分頃、北海道東方沖を震源とする地震がありました。最大震度1を北海道で観測しています。震源の深さは約90km、地震の規模はM4.8と推定されます。この地震による津波の心配はありません。";
    });
  }

  Future<void> onFetchError(stack) async {
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
            ),
            TelopContent(
              text: _contentText,
              fontSize: _contentFontSize,
              speed: _telopSpeed,
            ),
          ],
        ),
      ),
    );
  }
}

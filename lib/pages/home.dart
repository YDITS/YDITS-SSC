//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Map<Screens, String> screensTitle = {
    Screens.eewMonitorDisplay: "EEW Monitor Display",
    Screens.tsunamiMonitorDisplay: "Tsunami Monitor Display",
    Screens.weatherEarthquakeTelopDisplay: "Weather Earthquake Telop Display",
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text(widget.title, style: const TextStyle(fontSize: 24)),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () => onScreenRootingButtonPress(index),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.blueGrey[800],
                  ),
                  child: SizedBox(
                    height: 64,
                    child: Center(
                      child: Text(screensTitle.values.toList()[index],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }

  void onScreenRootingButtonPress(index) {
    final pressedScreen = Screens.values[index];
    final pressedScreenTitle = screensTitle[pressedScreen];
    print("Screen Rooting Button was clicked: Screen `$pressedScreen`, Screen Title `$pressedScreenTitle`");
  }
}

enum Screens {
  eewMonitorDisplay,
  tsunamiMonitorDisplay,
  weatherEarthquakeTelopDisplay,
}

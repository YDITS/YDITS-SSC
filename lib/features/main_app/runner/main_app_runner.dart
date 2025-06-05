//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//


import 'package:ydits_ssc/core/core.dart';

/// YDITS for SSC メインアプリケーションの実行管理
final class YditsSscMainAppRunner extends MainAppRunner {
  YditsSscMainAppRunner({
    required super.app,
    required super.windowConfig,
    super.logger,
  });

  /// WindowManagerインスタンス
  late final WindowManager subWindowManager;

  /// サブウィンドウをイニシャライズする
  /*
  Future<void> _initializeSubWindows() async {
    subWindowManager = WindowManager(
        onFailedCloseWindow: (int windowId) => _onFailedCloseWindow(windowId));

    final WindowController eewMonitorDisplayWindow =
        await subWindowManager.createNewWindow(
      title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? "",
      window: SubWindows.eewMonitorDisplay,
    );
    final WindowController tsunamiMonitorDisplayWindow =
        await subWindowManager.createNewWindow(
      title: subWindowsTitle[SubWindows.tsunamiMonitorDisplay] ?? "",
      window: SubWindows.tsunamiMonitorDisplay,
    );
    final WindowController weatherEarthquakeTelopDisplayWindow =
        await subWindowManager.createNewWindow(
      title: subWindowsTitle[SubWindows.weatherEarthquakeTelopDisplay] ?? "",
      window: SubWindows.weatherEarthquakeTelopDisplay,
    );

    subWindows = {
      SubWindows.eewMonitorDisplay: eewMonitorDisplayWindow,
      SubWindows.tsunamiMonitorDisplay: tsunamiMonitorDisplayWindow,
      SubWindows.weatherEarthquakeTelopDisplay:
          weatherEarthquakeTelopDisplayWindow,
    };
  }
  */
}

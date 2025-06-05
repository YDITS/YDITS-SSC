//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:ydits_ssc/core/core.dart';
import 'package:ydits_ssc/features/features.dart';

late final Logger logger;

Future<void> main(List<String> args) async {
  _initializeLogger();

  final mainAppConfig = YditsSscAppConfig();
  final mainAppWindowConfig = YditsSscWindowConfig();
  final subWindows = await _configureSubWindows();

  final mainAppRunner = YditsSscMainAppRunner(
    app: YditsSscApp(config: mainAppConfig, subWindows: subWindows),
    windowConfig: mainAppWindowConfig,
    logger: logger,
  );

  final subAppRunner = YditsSscSubAppRunner(logger: logger);

  final appRunner = YditsSscAppRunner(
    args: args,
    mainAppRunner: mainAppRunner,
    subAppRunner: subAppRunner,
    logger: logger,
  );

  await appRunner.runApp();
}

/// Loggerをイニシャライズする
void _initializeLogger() {
  logger = Logger("ydits_ssc");
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

/// サブウィンドウをイニシャライズする
Future<Map<SubWindows, WindowController>> _configureSubWindows() async {
  final subWindowManager = WindowManager(
    onFailedCloseWindow: (int windowId) => _onFailedCloseWindow(windowId),
  );

  final WindowController eewMonitorDisplayWindow = await subWindowManager
      .createNewWindow(
        title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? "",
        window: SubWindows.eewMonitorDisplay,
      );
  final WindowController tsunamiMonitorDisplayWindow = await subWindowManager
      .createNewWindow(
        title: subWindowsTitle[SubWindows.tsunamiMonitorDisplay] ?? "",
        window: SubWindows.tsunamiMonitorDisplay,
      );
  final WindowController weatherEarthquakeTelopDisplayWindow =
      await subWindowManager.createNewWindow(
        title: subWindowsTitle[SubWindows.weatherEarthquakeTelopDisplay] ?? "",
        window: SubWindows.weatherEarthquakeTelopDisplay,
      );

  return {
    SubWindows.eewMonitorDisplay: eewMonitorDisplayWindow,
    SubWindows.tsunamiMonitorDisplay: tsunamiMonitorDisplayWindow,
    SubWindows.weatherEarthquakeTelopDisplay:
        weatherEarthquakeTelopDisplayWindow,
  };
}

/// ウィンドウのクローズに失敗したときの処理
void _onFailedCloseWindow(int windowId) {
  logger.warning("Failed to close the sub window | windowId: `$windowId`");
}

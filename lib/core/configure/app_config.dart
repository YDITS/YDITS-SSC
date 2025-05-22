import 'package:ydits_ssc/core/version/version.dart';

/// アプリケーションの構成設定
class AppConfig {
  const AppConfig({
    required this.title,
    required this.description,
    required this.version,
  });

  /// アプリケーションのタイトル
  final String title;

  /// アプリケーションの説明
  final String description;

  /// アプリケーションのバージョン
  final Version version;
}

import 'dart:ui';

class AppConfig {
  static List<String> appApiHosts = [
    'http://121.41.2.145:20070',
    'https://ihvdsaaz.gxqiteng.cn',
    'https://ihvdsaaz.aotbf.cn',
  ];
  static String apiBaseUrl = "";

  static Future<void> initConfig(
    Future<bool> Function(String host)? probe,
  ) async {
    for (final host in AppConfig.appApiHosts) {
      try {
        final success = await probe?.call(host);
        if (success == true) {
          apiBaseUrl = host;
        }
      } catch (e) {
        continue;
      }
    }
  }

  static const Color mainColor = Color(0xFF00B70B);
  static const Color semeColor = Color(0xFF676566);
}


import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  // 初始化方法（应用启动时调用）
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool? getBool(String key) {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.getBool(key);
  }

  static Future<bool> saveBool(String key, bool value) {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.setBool(key, value);
  }

  // 同步保存字符串（需确保已初始化）
  static Future<bool> saveString(String key, String value) {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.setString(key, value);
  }

  // 同步读取字符串（需确保已初始化）
  static String? getString(String key) {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.getString(key);
  }

  //同步删除字符串（需确保已初始化）
  static Future<bool> removeString(String key) {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.remove(key);
  }

  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  static Future<bool> saveTokens(
      String accessToken, String refreshToken) async {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    final res1 = await _prefs!.setString(_accessTokenKey, accessToken);
    final res2 = await _prefs!.setString(_refreshTokenKey, refreshToken);
    return res1 && res2;
  }

  static String? getAccessToken() {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.getString(_accessTokenKey);
  }

  static String? getRefreshToken() {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    return _prefs!.getString(_refreshTokenKey);
  }

  static Future<bool> clearTokens() async {
    assert(_prefs != null, '请先调用 LocalStorage.init() 初始化');
    final res1 = await _prefs!.remove(_accessTokenKey);
    final res2 = await _prefs!.remove(_refreshTokenKey);
    return res1 && res2;
  }
}

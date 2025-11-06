import 'dart:ui';

import 'package:flutter_scaffod/data/providers/base_change_notifier.dart';

class MineController extends BaseChangeNotifier {
  bool _openPush = false;

  bool get openPush => _openPush;

  final List<String> options = [
    '隐私政策',
    '用户协议',
    '个性化推送',
    '注销账号',
  ];

  final List<VoidCallback> actions = [
    () {},
    () {},
    () {},
    () {},
  ];

  openPushValue(bool value) {
    _openPush = value;
    notifyListeners();
  }
}

import 'package:flutter_scaffod/data/providers/base_change_notifier.dart';

class IndexController extends BaseChangeNotifier {
  final List<String> tabs = [
    '全部',
    '足球',
    '篮球',
    '赛程',
    '赛果'
  ];
  
}
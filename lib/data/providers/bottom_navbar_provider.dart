import 'package:flutter_scaffod/data/providers/base_change_notifier.dart';

class BottomNavbarProvider extends BaseChangeNotifier {
  List<AppTabDataModel> tabs = [
    AppTabDataModel(
        title: '首页',
        icon1: 'assets/icons/home.png',
        icon2: 'assets/icons/home_1.png'),
    AppTabDataModel(
        title: '选择交换',
        icon1: 'assets/icons/search.png',
        icon2: 'assets/icons/search_1.png'),
    AppTabDataModel(
        title: '上传房源',
        icon1: 'assets/icons/city.png',
        icon2: 'assets/icons/city_1.png'),
    AppTabDataModel(
        title: '旅行商城',
        icon1: 'assets/icons/shop.png',
        icon2: 'assets/icons/shop_1.png'),
    AppTabDataModel(
        title: '我的',
        icon1: 'assets/icons/mine.png',
        icon2: 'assets/icons/mine_1.png'),
  ];
}

class AppTabDataModel {
  final String title;
  final String icon1;
  final String icon2;
  AppTabDataModel(
      {required this.title, required this.icon1, required this.icon2});
}

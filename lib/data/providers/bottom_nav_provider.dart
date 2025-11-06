import 'package:flutter/cupertino.dart';
import 'package:flutter_scaffod/data/providers/base_change_notifier.dart';

class BottomNavbarProvider extends BaseChangeNotifier {
  late PageController pageController;
  int currentIndex = 0;
  BottomNavbarProvider() {
    pageController = PageController();
  }
  List<AppTabDataModel> tabs = [
    AppTabDataModel(
        title: '赛事',
        icon1: 'assets/icons/game.png',
        icon2: 'assets/icons/game_1.png'),
    AppTabDataModel(
        title: '咨讯',
        icon1: 'assets/icons/news.png',
        icon2: 'assets/icons/news_1.png'),
    AppTabDataModel(
        title: '我的',
        icon1: 'assets/icons/mine.png',
        icon2: 'assets/icons/mine_1.png'),
  ];

  setPage(index){
    if(currentIndex == index) return;
    currentIndex = index;
    pageController.jumpToPage(index);
    notifyListeners();
  }
}

class AppTabDataModel {
  final String title;
  final String icon1;
  final String icon2;
  AppTabDataModel(
      {required this.title, required this.icon1, required this.icon2});
}

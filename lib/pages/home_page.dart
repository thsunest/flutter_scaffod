import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';
import 'package:flutter_scaffod/pages/index_page/index_page.dart';
import 'package:provider/provider.dart';

import '../data/providers/bottom_navbar_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        children: const [
          IndexPage(),
          Center(child: Text('选择交换')),
          Center(child: Text('上传房源')),
          Center(child: Text('旅行商城')),
          Center(child: Text('我的')),
        ],
      ),
      bottomNavigationBar: Consumer<BottomNavbarProvider>(
        builder: (context, bottomNavbarProvider, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _pageIndex,
            selectedItemColor: AppConfig.mainColor,
            unselectedItemColor: AppConfig.accentColor,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            onTap: (index) {
              if (index == _pageIndex) return;
              setState(() {
                _pageIndex = index;
              });
              _pageController.jumpToPage(index);
            },
            items: bottomNavbarProvider.tabs.map((tab) {
              return BottomNavigationBarItem(
                icon: Image.asset(tab.icon1, width: 24, height: 24),
                activeIcon: Image.asset(tab.icon2, width: 24, height: 24),
                label: tab.title,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

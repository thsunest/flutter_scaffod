import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';
import 'package:flutter_scaffod/data/providers/bottom_nav_provider.dart';
import 'package:flutter_scaffod/pages/index/index_page.dart';
import 'package:flutter_scaffod/pages/mine/mine_page.dart';
import 'package:flutter_scaffod/pages/news/news_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(), // 禁止滑动切换页面
        controller: context.read<BottomNavbarProvider>().pageController,
        children: const [IndexPage(), NewsPage(), MinePage()],
      ),
      bottomNavigationBar: Consumer<BottomNavbarProvider>(
        builder: (context, bottomNavProvider, child) {
          return BottomNavigationBar(
            onTap: (index) {
              bottomNavProvider.setPage(index);
            },
            currentIndex: bottomNavProvider.currentIndex,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppConfig.mainColor,
            unselectedItemColor: AppConfig.semeColor,
            items: bottomNavProvider.tabs.map((tab) {
              return BottomNavigationBarItem(
                icon: Image.asset(tab.icon1, width: 24.w, height: 24.r),
                activeIcon: Image.asset(tab.icon2, width: 24.w, height: 24.r),
                label: tab.title,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

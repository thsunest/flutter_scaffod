import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scaffod/pages/index/game_detail/gamer_detail_page.dart';
import 'package:flutter_scaffod/pages/index/index_controller.dart';
import 'package:flutter_scaffod/utils/nav_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => IndexController(),
      child: Consumer<IndexController>(
        builder: (context, controller, child) {
          return _buildContent(context);
        },
      ),
    );
  }

  _buildContent(BuildContext context) {
    final ref = Provider.of<IndexController>(context);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(statusBarHeight + 72.h),
        child: _buildAppBar(context, ref, statusBarHeight),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 1),
              ),
              child: Center(child: Text('2025-10-11 今天 星期六')),
            ),
            _buildGameItem(
              "皇家马德里",
              "assets/images/team1.png",
              "巴萨罗拿",
              "assets/images/team2.png",
              "2 - 0",
              "19:00",
              "西甲",
              "下半场",
              context,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  //MARK appBar
  _buildAppBar(
    BuildContext context,
    IndexController ref,
    double statusBarHeight,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2BE072), Color(0xFF75D249)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 18.sp),
          unselectedLabelStyle: TextStyle(fontSize: 15.sp),
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.transparent,
          tabs: ref.tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
    );
  }

  //MARK GameItem
  _buildGameItem(
    String army1,
    String army1Logo,
    String army2,
    String army2Logo,
    String score,
    String time,
    String flag,
    String stadium,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => NavManager.push(GamerDetailPage()),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(army1),
                SizedBox(width: 12.w),
                Image.asset(army1Logo, width: 32.w, height: 32.h),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(time, style: TextStyle(fontSize: 9.sp)),
                      SizedBox(width: 1.w),
                      Text(flag, style: TextStyle(fontSize: 10.sp)),
                    ],
                  ),
                  Text(
                    score,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Color(0xFFEFEFEF),
                    ),
                    child: Center(
                      child: Text(stadium, style: TextStyle(fontSize: 9.sp)),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(army2Logo, width: 32.w, height: 32.h),
                SizedBox(width: 12.w),
                Text(army2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

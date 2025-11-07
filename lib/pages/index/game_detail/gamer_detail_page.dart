import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GamerDetailPage extends StatelessWidget {
  const GamerDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF5F5F5),
      child: Column(
        children: [
          Container(
            height: 235.h,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/game_bg.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/team1.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 10),
                        Text('切尔西'),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 45.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1:0'),
                          SizedBox(height: 12.h),
                          Text('19:30 英超 第 30 轮'),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/team1.png',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(height: 10),
                        Text('切尔西'),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 112.w,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(81, 81, 81, 0.8),
                  ),
                  child: Center(
                    child: Text(
                      '已结束',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('切尔西'), Text('0'), Text('0'), Text('切尔西')],
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width - 20.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10.r), child: Text('技术统计')),
                SizedBox(height: 1),
                Situation(type: '射门', count1: 10, count2: 5),
                Situation(type: '射门', count1: 2, count2: 0),
                Situation(type: '射门', count1: 1, count2: 523),
                Situation(type: '射门', count1: 33, count2: 51),
                Situation(type: '射门', count1: 3, count2: 1),
                Situation(type: '射门', count1: 10, count2: 5),
                Situation(type: '射门', count1: 2, count2: 0),
                Situation(type: '射门', count1: 1, count2: 523),
                Situation(type: '射门', count1: 33, count2: 51),
                Situation(type: '射门', count1: 3, count2: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Situation extends StatelessWidget {
  final String type;
  final int count1;
  final int count2;
  const Situation({
    super.key,
    required this.type,
    required this.count1,
    required this.count2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Center(child: Text(count1.toString())),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(height: 8.h, color: Colors.grey[200]),
                        Row(
                          children: [
                            Expanded(
                              flex: count2,
                              child: Container(height: 8.h),
                            ),
                            Expanded(
                              flex: count1,
                              child: Container(
                                height: 8.h,
                                color: count1 > count2
                                    ? Colors.orangeAccent
                                    : AppConfig.semeColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 72.w,
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Center(child: Text(type)),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Container(height: 8.h, color: Colors.grey[200]),
                        Row(
                          children: [
                            Expanded(
                              flex: count2,
                              child: Container(
                                height: 8.h,
                                color: count2 > count1
                                    ? Colors.orangeAccent
                                    : AppConfig.semeColor,
                              ),
                            ),
                            Expanded(
                              flex: count1,
                              child: Container(height: 8.h),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Center(child: Text(count2.toString())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

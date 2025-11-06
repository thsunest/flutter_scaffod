import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 79.h,),
          Indicator(),
          Text('Index Page'),
        ],
      ),
    ));
  }
}

class Indicator extends StatefulWidget {
  const Indicator({super.key});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5 ,
                  height: 37.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Image.asset('assets/images/ft.png', width: 20.w, height: 20.h),
                    SizedBox(width: 8.w),
                    Text(
                      '足球',
                      style: TextStyle(fontSize: 14.sp, color: Color(0xFF333333)),
                    ),
                  ],
                ),
              ),

            ],
          ),

          Row(
            children: [
              Image.asset('assets/images/bs.png', width: 20.w, height: 20.h),
              SizedBox(width: 8.w),
              Text(
                '篮球',
                style: TextStyle(fontSize: 14.sp, color: Color(0xFF333333)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

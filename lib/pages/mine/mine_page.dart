import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffod/pages/mine/mine_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../configs/app_config.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => MineController(),
        child: Consumer<MineController>(builder: (context, ref, child) {
          return _buildContent(context);
        }));
  }
  //MARK content
  _buildContent(BuildContext context) {
    final ref = Provider.of<MineController>(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: 198.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/mine_bg.png',
                ),
                fit: BoxFit.fill,
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              SizedBox(height: 72.h),
              Row(
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 46.w,
                    height: 46.h,
                  ),
                  SizedBox(width: 7.w),
                  Text(
                    '用户名',
                    style: TextStyle(
                      color: Color(0xFF1B760F),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      16.r,
                    ),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return _buildOptionItem(
                        ref.options[index], ref.actions[index], index, context);
                  }, separatorBuilder: (context,index) {
                    return Divider(height: 1, color: Color(0x00000014).withOpacity(0.08));
                  }, itemCount: ref.options.length )
                ),
              ),
              SizedBox(height: 45.h),
              _buildLogoutButton(context)
            ],
          ),
        ),
      ],
    ));
  }

  _buildOptionItem(
      String title, VoidCallback onTap, int index, BuildContext context) {
    final ref = Provider.of<MineController>(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.sp),
            ),
            index != 2
                ? Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey)
                : CupertinoSwitch(
                    activeTrackColor: AppConfig.mainColor,
                    value: ref.openPush,
                    onChanged: ref.openPushValue),
          ],
        ),
      ),
    );
  }

  _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO : 退出登录逻辑
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppConfig.mainColor,
        ),
        width: MediaQuery.of(context).size.width,
        height: 58.h,
        margin: EdgeInsets.symmetric(horizontal: 40.w),
        child: Center(
          child: Text(
            '退出登录',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

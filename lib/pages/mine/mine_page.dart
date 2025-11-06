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

  _buildContent(BuildContext context) {
    final ref = Provider.of<MineController>(context);
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mine_bg.png'),
            fit: BoxFit.cover,
          ),
        )),
        Column(
          children: [
            SizedBox(height: 72.h),
            Image.asset(
              'assets/images/avatar.png',
              width: 68.w,
              height: 68.h,
            ),
            SizedBox(height: 12.h),
            Text(
              '用户名',
            ),
            SizedBox(
              height: 55.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27.r),
                    topRight: Radius.circular(27.r),
                  ),
                ),
                child: Column(children: [
                  SizedBox(height: 24.h),
                  ...List.generate(ref.options.length, (index) {
                    final title = ref.options[index];
                    final onTap = ref.actions[index];
                    return _buildOptionItem(title, onTap, index, context);
                  }),
                  SizedBox(
                    height: 129.h,
                  ),
                  _buildLogoutButton(context)
                ]),
              ),
            )
          ],
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
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1.h),
          ),
        ),
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

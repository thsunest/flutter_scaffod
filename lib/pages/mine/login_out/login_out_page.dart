import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';
import 'package:flutter_scaffod/utils/nav_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOutPage extends StatelessWidget {
  const LoginOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注销账户')),
      body: Column(
        children: [
          SizedBox(height: 56.h),
          Text(
            '申请注销账户',
            style: TextStyle(fontSize: 17.sp, color: Colors.red),
          ),
          Text(
            '备注:\n1.注销过程不可逆，切无法申请恢复\n2.为了您的账号安全，将会有7天的确认期在此期间内登录账号，将自动取消注销申请',
            style: TextStyle(fontSize: 17.sp),
          ),
          SizedBox(height: 81.h),
          Column(
            children: [
              Container(
                height: 58,
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppConfig.mainColor,
                ),
                child: Center(
                  child: Text(
                    '提交',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () => NavManager.pop(),
                child: Container(
                  height: 58,
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppConfig.mainColor,
                  ),
                  child: Center(
                    child: Text(
                      '取消',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

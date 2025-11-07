import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2BE072), Color(0xFF75D249)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text('登录', style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.transparent,
            ),
            Column(
              children: [
                SizedBox(height: 151.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: '请输入您的手机号',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Image.asset(
                          'assets/icons/phone.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: '请输入验证码',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Image.asset(
                                'assets/icons/psd.png',
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '获取验证码',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
                SizedBox(height: 41.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "注册并登录",
                      style: TextStyle(
                        color: AppConfig.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 28.h),
                Row(
                  children: [
                    Checkbox(
                      shape: CircleBorder(),
                      checkColor: AppConfig.mainColor,
                      activeColor: Colors.white,
                      value: true,
                      onChanged: (val) {},
                    ),
                    RichText(
                      text: TextSpan(
                        text: '我已阅读并同意',
                        style: const TextStyle(
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: '《用户协议》',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' 与 '),
                          TextSpan(
                            text: '《隐私政策》',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

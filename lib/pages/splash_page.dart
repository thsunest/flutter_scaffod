import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';
import 'package:flutter_scaffod/pages/home_page.dart';
import 'package:flutter_scaffod/pages/login/login_page.dart';
import 'package:flutter_scaffod/utils/nav_manager.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/local_storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await LocalStorage.init();
    if (!mounted) return;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      final TapGestureRecognizer userAgreementRecognizer =
          TapGestureRecognizer();
      final TapGestureRecognizer privacyPolicyRecognizer =
          TapGestureRecognizer();

      final result = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          userAgreementRecognizer.onTap = () {
            Navigator.of(dialogContext).pop('agreement');
          };

          privacyPolicyRecognizer.onTap = () {
            Navigator.of(dialogContext).pop('privacy');
          };

          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('欢迎使用', textAlign: TextAlign.center),
            content: SizedBox(
              width: double.maxFinite,
              child: Text.rich(
                TextSpan(
                  text:
                      '为了保障软件服务的安全、运营的质量及效率，我们会收集您的设备信息和服务日志，具体内容请参照隐私条款;为了预防恶意程序，确保运营质量及效率，我们会收集安装的应用信息或正在运行的进程信息，如果未经您的授权，我们不会使用您的个人信息用于您未授权的其他途径或目的。\n我们非常重视对您个人信息的保护，您需要同意，',
                  style: const TextStyle(color: Colors.black87, height: 1.5),
                  children: [
                    TextSpan(
                      text: '《用户协议》',
                      style: const TextStyle(
                        color: Color(0xFF2BE072),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: userAgreementRecognizer,
                    ),
                    const TextSpan(text: ' 与 '),
                    TextSpan(
                      text: '《隐私政策》',
                      style: const TextStyle(
                        color: Color(0xFF2BE072),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: privacyPolicyRecognizer,
                    ),
                    const TextSpan(text: '才能继续使用我们的服务哦。'),
                  ],
                ),
              ),
            ),
            actionsPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
            actions: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop('decline'),
                        child: Container(
                          
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: BoxBorder.fromLTRB(
                              top: BorderSide(color: Colors.grey.shade300, width: 1),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.r),
                            ),
                          ),
                          child: Center(child: const Text('不同意')),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop('accept'),
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppConfig.mainColor,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.r),
                            ),
                          ),
                          child: Center(
                            child: const Text(
                              '同意',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );

      userAgreementRecognizer.dispose();
      privacyPolicyRecognizer.dispose();

      if (!mounted) return;

      switch (result) {
        case 'decline':
          Navigator.of(context).pop();
          break;
        case 'privacy':
          NavManager.push(const HomePage());
          break;
        case 'accept':
          NavManager.push(const LoginPage());
          break;
        default:
          break;
      }
    });
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash_bg.png'),
            SizedBox(height: 20),
            Text(
              '顶级赛事 全程直播',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scaffod/data/providers/bottom_nav_provider.dart';
import 'package:flutter_scaffod/injections/injection.dart';
import 'package:flutter_scaffod/pages/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/nav_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //只能纵向
    DeviceOrientation.portraitDown, //只能纵向
  ]);
  setupInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 全局Provider列表
        ChangeNotifierProvider(create: (_) => BottomNavbarProvider()),
      ],
      child: ScreenUtilInit(
        //TODO 根据设计稿尺寸修改
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true, //分屏适配
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(backgroundColor: Colors.white),
            ),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate, // 提供 Material 组件的中文文本
              GlobalWidgetsLocalizations.delegate, // 控制文本方向（如左对齐/右对齐）
              GlobalCupertinoLocalizations
                  .delegate, // iOS 风格组件的中文文本（必须添加，否则 iOS 可能报错）
            ],
            supportedLocales: [
              const Locale('zh', 'CN'), // 中文，简体
            ],
            locale: const Locale('zh', 'CN'),
            builder: (context, child) {
              child = BotToastInit()(context, child);
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: child,
              );
            },
            navigatorKey: NavManager.navigatorKey,
            home: const SplashPage()),
      ),
    );
  }
}

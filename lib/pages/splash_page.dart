import 'package:flutter/material.dart';
import 'package:flutter_scaffod/pages/home_page.dart';
import 'package:flutter_scaffod/utils/nav_manager.dart';

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

  Future<void> _initLocalStorage() async {
    await LocalStorage.init();
  }

  Future<void> _bootstrap() async {
    await _initLocalStorage();
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      NavManager.pushReplacement(const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

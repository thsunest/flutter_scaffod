import 'package:flutter/material.dart';
import 'package:flutter_scaffod/pages/home_page.dart';
import 'package:flutter_scaffod/utils/nav_manager.dart';
import 'package:flutter/scheduler.dart';

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

    // Defer navigation until after the first frame to avoid build-phase routing exceptions.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      NavManager.push(const HomePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}

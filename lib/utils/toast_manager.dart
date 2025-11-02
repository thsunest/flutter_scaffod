import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../widgets/my_toast.dart';

class ToastManager {
  static void show(String text) {
    // BotToast.showText(text: text);
    BotToast.showCustomText(
      toastBuilder: (cancelFunc) => MyToast(message: text),
      duration: const Duration(seconds: 2),
      align: Alignment.center,
      animationDuration: Duration.zero,
      animationReverseDuration: Duration.zero,
      // wrapAnimation: (controller, cancel, child) => child,
    );
  }

  static void showFaild(String text) {
    BotToast.showCustomText(
      toastBuilder: (cancelFunc) => MyToast(
        message: text,
        iconUrl: 'assets/icons/warning.png',
      ),
      duration: const Duration(seconds: 2),
      align: Alignment.center,
      animationDuration: Duration.zero,
      animationReverseDuration: Duration.zero,
      // wrapAnimation: (controller, cancel, child) => child,
    );
  }

  static void showError(String text) {
    developer.log(text, name: 'ERROR', time: DateTime.now(), level: 2000);
    BotToast.showCustomText(
      toastBuilder: (CancelFunc) => MyToast(message: text),
      duration: Duration(seconds: 10),
      align: Alignment.center,
      animationDuration: Duration.zero,
      animationReverseDuration: Duration.zero,
    );
  }
}

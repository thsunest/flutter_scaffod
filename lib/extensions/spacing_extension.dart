import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  Widget get h => SizedBox(
        height: toDouble().r,
      );
  Widget get w => SizedBox(
        width: toDouble().r,
      );
}

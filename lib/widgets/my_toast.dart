import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyToast extends StatelessWidget {
  final String message;
  final String? iconUrl;

  const MyToast({super.key, required this.message, this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 75, 75, 75),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 21),
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (iconUrl != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(iconUrl!),
            SizedBox(height: 8.r,),
            Text(
              message,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 120.r),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.white,
          ),
        ),
      );
    }
  }
}

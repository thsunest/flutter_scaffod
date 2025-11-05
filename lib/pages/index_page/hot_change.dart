import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';

class HotChange extends StatelessWidget {
  const HotChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '热门交换',
              style: TextStyle(color: AppConfig.mainColor, fontSize: 18),
            ),
            SizedBox(width: 8),
            Text(
              '任意住宿',
              style: TextStyle(color: Colors.black87, fontSize: 18),
            )
          ],
        ),
        SizedBox(height: 8),
        Text('房屋交换——体验不一样的旅行方式'),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Image.asset('assets/imgs/index_bg.jpg',height: 120),
                  Text('交换|广州私家庭院房')
                ],
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Image.asset('assets/imgs/index_bg.jpg'),
                  Text('交换|广州私家庭院房')
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

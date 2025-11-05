import 'package:flutter/material.dart';
import 'package:flutter_scaffod/configs/app_config.dart';

class FunctArea extends StatelessWidget {
  const FunctArea({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> icons = [
      'assets/icons/city_1.png',
      'assets/icons/home_1.png',
      'assets/icons/mine_1.png',
      'assets/icons/search_1.png',
      'assets/icons/shop_1.png',
    ];
    final List<String> titles = ['精品交换', '交换城市', '交换农村', '交换景点', '任宿全国'];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width - 20,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 7),
            decoration: BoxDecoration(
              color: Color(0xFFF0ECEB),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '交换公约',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppConfig.mainColor),
                    ),
                    SizedBox(width: 8),
                    Text('如何进行房屋交换？',
                        style: TextStyle(fontSize: 14, color: Colors.black87)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '立即查看',
                      style:
                          TextStyle(fontSize: 12, color: AppConfig.mainColor),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 12, color: AppConfig.mainColor),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(icons.length, (index) {
              return _buildItem(icons[index], titles[index]);
            }),
          ),
        ],
      ),
    );
  }

  _buildItem(String iconPath, String title) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('News Page'),
      ),
    );
  }

  _buildNewsItem(
    String title,
    String content,
    List<String> imageUrls,
  ) {
    return Column(
      children: [
        Text(title),
        Text(content),
        Row(
          children: imageUrls
              .map((url) => Image.network(url, width: 115.w, height: 115.h))
              .toList(),
        )
      ],
    );
  }
}

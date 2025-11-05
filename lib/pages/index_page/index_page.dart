import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffod/pages/index_page/funct_area.dart';
import 'package:flutter_scaffod/pages/index_page/hot_change.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              'assets/imgs/index_bg.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const FunctArea(),
                  const HotChange()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

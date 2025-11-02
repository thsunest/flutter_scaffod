import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String errorMsg;

  const ErrorPage({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Text(
            errorMsg,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/youtube_logo.png",
          width: 200,
        ),
      ),
      body: const Center(
        child: Text('Hello World!'),
      ),
    );
  }
}

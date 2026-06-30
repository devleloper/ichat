import 'package:flutter/material.dart';

void main() {
  runApp(const IChatApp());
}

class IChatApp extends StatelessWidget {
  const IChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'iChat',
      home: Scaffold(
        body: Center(
          child: Text('iChat'),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 페이지'),
      ),
      body: const Center(
        child: Text(
          '새 페이지입니다.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

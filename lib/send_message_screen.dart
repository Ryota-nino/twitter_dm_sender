import 'package:flutter/material.dart';

class SendMessageScreen extends StatelessWidget {
  SendMessageScreen({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("メッセージ送信"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("アカウント名：リヴォルエッグ"),
            const Text("ID：@rivolegg"),
            Text(title),
            Text(content),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DirectMessageScreen extends StatelessWidget {
  const DirectMessageScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = [
      {
        "id": 1,
        "title": "フォロー時のメッセージ",
        "content": "フォローありがとうございます！\nリヴォルエッグです！",
      },
      {
        "id": 2,
        "title": "3/22ライブ告知",
        "content": "フォローありがとうございます！\nリヴォルエッグです！",
      },
      {
        "id": 3,
        "title": "4/20ライブ告知",
        "content": "フォローありがとうございます！\nリヴォルエッグです！",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(list[index]["title"]),
              tileColor: Colors.black12,
              contentPadding: EdgeInsets.all(3),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

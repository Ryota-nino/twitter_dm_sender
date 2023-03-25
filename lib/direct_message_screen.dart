import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:twitter_dm_sender/regist_message_screen.dart';
import 'package:twitter_dm_sender/send_message_screen.dart';

class DirectMessageScreen extends StatefulWidget {
  const DirectMessageScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<DirectMessageScreen> createState() => _DirectMessageScreenState();
}

class _DirectMessageScreenState extends State<DirectMessageScreen> {
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
        title: Text(widget.title),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.edit),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const RegistMessageScreen(title: '新規メッセージ追加')),
          );
        },
        label: const Text(
          'メッセージ追加',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(list[index]["title"]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendMessageScreen(
                      title: list[index]["title"],
                      content: list[index]["content"],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

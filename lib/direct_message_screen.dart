import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:twitter_dm_sender/regist_message_screen.dart';
import 'package:twitter_dm_sender/send_message_screen.dart';
import 'package:twitter_dm_sender/models/database_helper.dart';

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
  bool isEdit = false;
  // DatabaseHelper クラスのインスタンス取得
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> list = [
    //   {
    //     "id": 1,
    //     "title": "フォロー時のメッセージ",
    //     "content": "フォローありがとうございます！\nリヴォルエッグです！",
    //   },
    //   {
    //     "id": 2,
    //     "title": "3/22ライブ告知",
    //     "content": "フォローありがとうございます！\nリヴォルエッグです！",
    //   },
    //   {
    //     "id": 3,
    //     "title": "4/20ライブ告知",
    //     "content": "フォローありがとうございます！\nリヴォルエッグです！",
    //   },
    // ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          if (isEdit == true) ...{
            TextButton(
              child: const Text(
                "完了",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  isEdit = false;
                  print(isEdit);
                  print("編集完了");
                });
              },
            ),
          } else ...{
            TextButton(
              child: const Text(
                "編集",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  this.isEdit = true;
                  print(isEdit);
                  print("編集モード");
                });
              },
            ),
          }
        ],
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
      body: FutureBuilder(
        future: dbHelper.queryAllRows(),
        builder: (context, future) {
          if (!future.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("メッセージがありません。"),
                Text("新しく追加してください"),
              ],
            );
          } else {
            List<Map<String, dynamic>>? list = future.data;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      list[index]["title"],
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Visibility(
                      visible: isEdit,
                      child: Wrap(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {},
                          ),
                        ],
                      ),
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
            );
          }
        },
      ),
    );
  }

  // // 照会ボタンクリック
  // void _query() async {
  //   final allRows = await dbHelper.queryAllRows();
  //   print('全てのデータを照会しました。');
  //   allRows.forEach(print);
  // }
}

import 'package:flutter/material.dart';
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
  late List<Map<String, dynamic>>? list = [];

  @override
  Widget build(BuildContext context) {
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
                  isEdit = true;
                  print("編集モード");
                });
              },
            ),
          }
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final Map<String, dynamic> newMessage =
              await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    const RegistMessageScreen(screenTitle: '新規メッセージ追加')),
          );
          setState(() {
            list!.add(newMessage);
          });
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("メッセージがありません。"),
                  const Text("新しく追加してください。"),
                ],
              ),
            );
          } else {
            // クエリデータは読み取り専用なのでデータを変換して格納する。
            list = List<Map<String, dynamic>>.from(future.data as Iterable);
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(
                          list![index]["title"],
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Visibility(
                          visible: isEdit,
                          child: Wrap(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  // final id = await dbHelper.queryRowCount();
                                  final int id = list![index]["_id"];
                                  final rowsDeleted = await dbHelper.delete(id);
                                  setState(() {
                                    // list!.removeAt(index);
                                  });
                                  print(list);
                                  print('削除しました。 $rowsDeleted ID: $id');
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        onTap: () async {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SendMessageScreen(
                                title: list![index]["title"],
                                content: list![index]["content"],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

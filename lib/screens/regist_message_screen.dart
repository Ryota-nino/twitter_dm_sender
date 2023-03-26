import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_dm_sender/models/database_helper.dart';

class RegistMessageScreen extends StatefulWidget {
  const RegistMessageScreen({
    required this.screenTitle,
    super.key,
  });

  final String screenTitle;

  @override
  State<RegistMessageScreen> createState() => _RegistMessageScreenState();
}

class _RegistMessageScreenState extends State<RegistMessageScreen> {
  String title = "";
  String content = "";

  // DatabaseHelper クラスのインスタンス取得
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'タイトル',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  onChanged: (text) {
                    // TODO: ここで取得したtextを使う
                    title = text;
                  },
                ),
                const SizedBox(height: 30),
                TextFormField(
                  maxLines: 6,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: 'メッセージ内容',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  onChanged: (text) {
                    content = text;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> row = {
                      DatabaseHelper.title: title,
                      DatabaseHelper.content: content,
                      DatabaseHelper.unsend: 4000
                    };
                    final id = await dbHelper.insert(row);
                    Navigator.of(context).pop(row);
                  },
                  child: const Text("追加"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // // 登録ボタンクリック
  // void _insert(
  //   String title,
  //   content,
  // ) async {
  //   // row to insert
  //   Map<String, dynamic> row = {
  //     DatabaseHelper.title: title,
  //     DatabaseHelper.content: content,
  //     DatabaseHelper.unsend: 4000
  //   };
  //   final id = await dbHelper.insert(row);
  //   print('登録しました。id: $id');
  // }
}

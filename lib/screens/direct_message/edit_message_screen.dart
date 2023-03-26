import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_dm_sender/models/database_helper.dart';

class EditMessageScreen extends StatefulWidget {
  const EditMessageScreen({
    required this.title,
    required this.msgData,
    super.key,
  });

  final String title;
  final Map<String, dynamic> msgData;

  @override
  State<EditMessageScreen> createState() => _EditMessageScreenState();
}

class _EditMessageScreenState extends State<EditMessageScreen> {
  @override
  Widget build(BuildContext context) {
    final dbHelper = DatabaseHelper.instance;
    Map<String, dynamic> msg = Map<String, dynamic>.from(widget.msgData);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                  initialValue: widget.msgData["title"],
                  onChanged: (text) {
                    msg["title"] = text;
                  },
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
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: widget.msgData["content"],
                  onChanged: (text) {
                    msg["content"] = text;
                  },
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
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> row = {
                      DatabaseHelper.id: msg["_id"],
                      DatabaseHelper.title: msg["title"],
                      DatabaseHelper.content: msg["content"]
                    };
                    final rowsAffected = await dbHelper.update(row);
                    Navigator.of(context).pop(row);
                  },
                  child: const Text("更新"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

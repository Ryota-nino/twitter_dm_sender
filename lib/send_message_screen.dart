import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) =>
          //           const RegistMessageScreen(title: '新規メッセージ追加')),
          // );
        },
        backgroundColor: Colors.orange,
        label: const Text(
          'メッセージ送信',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: const Icon(Icons.send),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("アカウント名：リヴォルエッグ"),
              const Text("ID：@rivolegg"),
              const SizedBox(height: 30),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Text(content),
              const SizedBox(height: 30),
              Text("このメッセージが未送信のフォロワー：3528名"),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '送信する人数',
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
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditMessageScreen extends StatelessWidget {
  const EditMessageScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
                Container(
                  alignment: Alignment.center,
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
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
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

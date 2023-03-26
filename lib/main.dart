import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_dm_sender/screens/account_screen.dart';
import 'package:twitter_dm_sender/screens/direct_message_screen.dart';
import 'package:twitter_dm_sender/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ページインデックス保存用
  int _screen = 0;
  // 表示する Widget の一覧
  static final List<Widget> _pageList = [
    const HomeScreen(),
    const DirectMessageScreen(title: "メッセージ一覧"),
    const AccountScreen(),
  ];

  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.mail),
        label: 'Message',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Account',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DM一斉送信',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // ページビュー
        body: _pageList[_screen],
        // ページ下部のナビゲーションメニュー
        bottomNavigationBar: BottomNavigationBar(
          // 現在のページインデックス
          currentIndex: _screen,
          // onTapでナビゲーションメニューがタップされた時の処理を定義
          onTap: (index) {
            setState(() {
              // ページインデックスを更新
              _screen = index;
            });
          },
          // 定義済のナビゲーションメニューのアイテムリスト
          items: myBottomNavBarItems(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

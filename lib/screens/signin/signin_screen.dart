import 'package:flutter/material.dart';
import 'package:twitter_dm_sender/screens/home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("サインイン"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: ((builder) => const HomeScreen()),
                  ),
                );
              },
              child: const Text("サインイン"),
            ),
          ],
        ),
      ),
    );
  }
}

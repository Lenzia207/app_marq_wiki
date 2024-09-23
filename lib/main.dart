import 'package:app_marq_wiki/src/features/chat/screen/chat_screen.dart';
import 'package:flutter/material.dart';

void main() {
  // await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ChatScreen(),
    );
  }
}

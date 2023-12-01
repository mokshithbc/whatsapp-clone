import 'package:flutter/material.dart';
import 'chatScreen.dart';
import 'Screen1.dart';

void main() {
  runApp(const Whatsapp());
}

class Whatsapp extends StatefulWidget {
  const Whatsapp({super.key});

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/chat': (context) => ChatScreen()
      },
    );
  }
}

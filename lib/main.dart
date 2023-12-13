import 'package:flutter/material.dart';
import 'package:untitled1/newMessage.dart';
import 'chatScreen.dart';
import 'Screen1.dart';
import 'enlargeProfilePic.dart';

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
        '/chat': (context) => ChatScreen(),
        '/enlargedProfile': (context) => EnlargeProfile(),
        '/newMessage': (context) => NewMessage()
      },
    );
  }
}

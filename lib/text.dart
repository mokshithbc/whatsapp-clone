import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color.fromRGBO(18, 140, 126, 1),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(children: <Widget>[
                      Icon(Icons.arrow_back),
                      CircleAvatar(
                        radius: 15.0,
                        backgroundImage: AssetImage('images/profilepic.jpg'),
                      )
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, top: 2.0, right: 2.0, bottom: 2.0),
                            child: Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                            ),
                          ),
                          const Text('online'),
                        ],
                      ),
                    ]),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.videocam),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.call_rounded),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

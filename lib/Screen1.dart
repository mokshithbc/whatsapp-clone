import 'package:flutter/material.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: const Color.fromRGBO(18, 140, 126, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 15),
                      const Text(
                        'WhatsApp',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "HelveticaNeu",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.groups_2_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      TextButton(
                        child: const Text('Chats',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 65.0,
                      ),
                      TextButton(
                        child: const Text('Updates',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 65.0,
                      ),
                      TextButton(
                        child: const Text('Calls',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: ChatList())
          ],
        ),
      ),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 30.0,
                  child: Image.asset('images/profilepic.jpg'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chat',
                      arguments: contacts[index]['name'],
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0.0, top: 2.0, right: 2.0, bottom: 2.0),
                            child: Text(
                              contacts[index]['name'],
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Text(contacts[index]['message'])
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            contacts[index]['time'],
                            style: TextStyle(fontSize: 13),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.volume_mute_rounded),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

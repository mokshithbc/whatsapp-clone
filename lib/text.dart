import 'package:flutter/material.dart';

class Text extends StatefulWidget {
  const Text({super.key});

  @override
  State<Text> createState() => _TextState();
}

class _TextState extends State<Text> {
  bool isDropDown = false;
  void toggleDropDown() {
    setState(() {
      isDropDown = !isDropDown;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Chat(toggleDropDown: toggleDropDown)],
            ),
            if (isDropDown) DropDown(),
          ],
        ),
      ),
    );
  }
}

class Chat extends StatefulWidget {
  Chat({super.key, this.toggleDropDown});
  Function? toggleDropDown;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final name = ModalRoute.of(context)!.settings.arguments as String;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () {
              widget.toggleDropDown!();
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  const DropDown({super.key});

  Widget dropDownButton(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 5,
        top: 20,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 3,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                dropDownButton('View contact'),
                dropDownButton('Media,Links,and docs'),
                dropDownButton('search'),
                dropDownButton('Mute notifications'),
                dropDownButton('Disappearing messages'),
                dropDownButton('wallpaper'),
                dropDownButton('more'),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ));
  }
}

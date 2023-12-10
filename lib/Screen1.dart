import 'package:flutter/material.dart';
import 'constants.dart';

// ignore_for_file: prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showDropDown = false;

  void toggleDropDown({required int flag}) {
    if (flag == 0) {
      showDropDown = !showDropDown;
    } else {
      showDropDown = false;
    }
    setState(() {});
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
              children: [
                Header(toggleDropDown: toggleDropDown),
                Expanded(child: ChatList()),
              ],
            ),
            if (showDropDown) DropDown(),
            if (showDropDown)
              HoverScreen(
                toggleDropDown: toggleDropDown,
              )
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
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(context, '/chat', arguments: {
                      'argName': contacts[index]['name'],
                      'argStatus': contacts[index]['status'],
                    });
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

class Header extends StatelessWidget {
  Header({super.key, this.toggleDropDown});

  Function? toggleDropDown;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () {
                  toggleDropDown!(flag: 0);
                },
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
                child:
                    const Text('Chats', style: TextStyle(color: Colors.white)),
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
                child:
                    const Text('Calls', style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  const DropDown({super.key});

  Widget ddButtons(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: 50,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        elevation: 3,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 5),
              ddButtons("New Group"),
              ddButtons("New Broadcast"),
              ddButtons("Linked Devices"),
              ddButtons("Starred Messages"),
              ddButtons("Payments"),
              ddButtons("Settings"),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverScreen extends StatelessWidget {
  HoverScreen({super.key, this.toggleDropDown});

  Function? toggleDropDown;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Material(
        color: Color.fromRGBO(0, 0, 0, 0),
        child: InkWell(
          onTap: () {
            toggleDropDown!(flag: 2);
          },
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

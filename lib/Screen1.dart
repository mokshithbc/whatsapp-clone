import 'package:flutter/material.dart';
import 'constants.dart';
import 'viewProfilePic.dart';
// ignore_for_file: prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Flag displayDropDown = Flag.closeAll;
  Flag displayProfilePic = Flag.closeAll;
  String profilePicArgs = '';

  void toggleProfilePic({required Flag flag, required String arg}) {
    if (flag == Flag.viewProfile) {
      displayProfilePic = flag;
      profilePicArgs = arg;
    } else {
      displayProfilePic = Flag.closeAll;
    }
    setState(() {});
  }

  void toggleDropDown({required Flag flag}) {
    if (flag == Flag.dropDownShow) {
      displayDropDown = flag;
    } else {
      displayDropDown = Flag.closeAll;
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
                Expanded(
                  child: ChatList(
                    toggleProfilePic: toggleProfilePic,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: Material(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/newMessage');
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(18, 140, 126, 1),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 60,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (displayProfilePic == Flag.viewProfile) BlackTranslucent(),
            if (displayDropDown == Flag.dropDownShow ||
                displayProfilePic == Flag.viewProfile)
              HoverScreen(
                toggleDropDown: toggleDropDown,
                toggleProfilePic: toggleProfilePic,
              ),
            if (displayDropDown != Flag.closeAll) DropDown(),
            if (displayProfilePic == Flag.viewProfile)
              ProfilePic(
                names: profilePicArgs,
                isNewMessage: false,
              ),
          ],
        ),
      ),
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
                  toggleDropDown!(flag: Flag.dropDownShow);
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

class ChatList extends StatelessWidget {
  ChatList({super.key, this.toggleProfilePic});

  Function? toggleProfilePic;

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
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  toggleProfilePic!(
                      flag: Flag.viewProfile, arg: contacts[index]['name']);
                },
                child: Hero(
                  tag: 'profile_${contacts[index]['name']}',
                  child: CircleAvatar(
                    radius: 30.0,
                    child: Image.asset('images/profilepic.jpg'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(context, '/chat', arguments: {
                      'argName': contacts[index]['name'],
                      'argStatus': contacts[index]['status']
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
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            contacts[index]['message'],
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          )
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

class DropDown extends StatelessWidget {
  const DropDown({super.key});

  Widget ddButtons(String text) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(15.0),
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
  HoverScreen({super.key, this.toggleDropDown, this.toggleProfilePic});

  Function? toggleDropDown, toggleProfilePic;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Material(
        color: Color.fromRGBO(0, 0, 0, 0),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            toggleDropDown!(flag: Flag.closeAll);
            toggleProfilePic!(flag: Flag.closeAll, arg: '');
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

class BlackTranslucent extends StatelessWidget {
  const BlackTranslucent({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Material(
        color: Colors.black12.withOpacity(0.3),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

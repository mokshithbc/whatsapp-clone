import 'package:flutter/material.dart';
import 'constants.dart';
import 'Chats.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Flag displayDropDown = Flag.closeAll;

  void toggleDropDown({required Flag flag}) {
    if (flag == Flag.dropDownShow && displayDropDown != Flag.closeAll) {
      displayDropDown = Flag.closeAll;
    } else {
      displayDropDown = flag;
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
            SingleChildScrollView(
              reverse: true,
              child: Stack(
                children: [
                  Image.network(
                    'https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png',
                    fit: BoxFit.fitHeight,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ],
              ),
            ),
            ChatList1(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Chat(toggleDropDown: toggleDropDown)],
            ),
            if (displayDropDown != Flag.closeAll)
              HoverScreen(
                toggleDropDown: toggleDropDown,
              ),
            if (displayDropDown == Flag.dropDownShow)
              DropDown(
                toggleDropDown: toggleDropDown,
              ),
            if (displayDropDown == Flag.moreDownShow) MoreButton(),
          ],
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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            toggleDropDown!(flag: Flag.closeAll);
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

class Chat extends StatefulWidget {
  Chat({super.key, this.toggleDropDown});

  Function? toggleDropDown;

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String name = args['argName'];

    String status = args['argStatus'];

    int index = contacts.indexWhere((contact) => contact['name'] == name);

    return Container(
      color: const Color.fromRGBO(18, 140, 126, 1),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 10.0, bottom: 10.0, right: 10.0),
              child: const Row(children: <Widget>[
                Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage('images/profilepic.jpg'),
                )
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              print(index);
              Navigator.pushNamed(
                context,
                '/viewProfile',
                arguments: index,
              );
            },
            child: Row(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, top: 2.0, right: 2.0, bottom: 3.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
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
              widget.toggleDropDown!(flag: Flag.dropDownShow);
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

Widget dropDownButton({required String input, int flag = 0}) {
  var onTapCallBack = flag == 0 ? () {} : null;
  return InkWell(
    onTap: onTapCallBack,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        input,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

class DropDown extends StatelessWidget {
  DropDown({
    super.key,
    this.toggleDropDown,
  });

  Function? toggleDropDown;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 5,
        top: 55,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 3,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                dropDownButton(input: 'View contact'),
                dropDownButton(input: 'Media,Links,and docs'),
                dropDownButton(input: 'search'),
                dropDownButton(input: 'Mute notifications'),
                dropDownButton(input: 'Disappearing messages'),
                dropDownButton(input: 'wallpaper'),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    toggleDropDown!(flag: Flag.moreDownShow);
                  },
                  child: Row(
                    children: <Widget>[
                      dropDownButton(input: 'more', flag: 1),
                      Spacer(),
                      Icon(Icons.arrow_right),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5)
              ],
            ),
          ),
        ));
  }
}

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 5,
        top: 45,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 3,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                dropDownButton(input: 'Report'),
                dropDownButton(input: 'Block'),
                dropDownButton(input: 'Clear chat'),
                dropDownButton(input: 'Export chat'),
                dropDownButton(input: 'Add shortcut'),
                SizedBox(height: 5)
              ],
            ),
          ),
        ));
  }
}

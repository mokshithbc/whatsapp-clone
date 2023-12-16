import 'package:flutter/material.dart';
import 'constants.dart';
import 'viewProfilePic.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Color.fromRGBO(18, 140, 126, 1),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Select contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              '120 contacts',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 140, 126, 1),
                            shape: BoxShape.circle,
                          ),
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.group,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'New group',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 140, 126, 1),
                            shape: BoxShape.circle,
                          ),
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Icon(
                              Icons.person_add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'New contact',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.qr_code,
                          size: 30,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 140, 126, 1),
                            shape: BoxShape.circle,
                          ),
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.groups,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'New community',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Contacts on WhatsApp',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                Expanded(
                  child: ContactsList(
                    toggleProfilePic: toggleProfilePic,
                  ),
                ),
              ],
            ),
            if (displayProfilePic == Flag.viewProfile) BlackTranslucent(),
            if (displayProfilePic == Flag.viewProfile)
              HoverScreen(
                toggleProfilePic: toggleProfilePic,
              ),
            if (displayProfilePic == Flag.viewProfile)
              ProfilePic(
                names: profilePicArgs,
                isNewMessage: true,
              ),
          ],
        ),
      ),
    );
  }
}

class ContactsList extends StatelessWidget {
  ContactsList({super.key, this.toggleProfilePic});

  Function? toggleProfilePic;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    toggleProfilePic!(
                        flag: Flag.viewProfile, arg: contacts[index]['name']);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      'images/profilepic.jpg',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 2.0, right: 2.0, bottom: 2.0),
                              child: Text(
                                contacts[index]['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              contacts[index]['bio'],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class HoverScreen extends StatelessWidget {
  HoverScreen({super.key, this.toggleProfilePic});

  Function? toggleProfilePic;

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

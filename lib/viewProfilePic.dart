import 'package:flutter/material.dart';
import 'constants.dart';

class ProfilePic extends StatelessWidget {
  ProfilePic({super.key, required this.names});
  String names;
  @override
  Widget build(BuildContext context) {
    int index = contacts.indexWhere((contact) => contact['name'] == names);
    return Positioned(
      top: 90,
      width: 300,
      left: 60,
      child: Material(
        elevation: 5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/enlargedProfile',
                    arguments: names);
              },
              child: Stack(
                children: [
                  Hero(
                    tag: 'profile_$names',
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Image.asset(
                        'images/profilepic.jpg',
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black12.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          names,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/chat',
                        arguments: {
                          'argName': names,
                          'argStatus': contacts[index]['status'],
                        },
                      );
                    },
                    icon: Icon(
                      Icons.message,
                      color: Color.fromRGBO(18, 140, 126, 1),
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call_rounded,
                      color: Color.fromRGBO(18, 140, 126, 1),
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.videocam_rounded,
                      color: Color.fromRGBO(18, 140, 126, 1),
                    )),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: Color.fromRGBO(18, 140, 126, 1),
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

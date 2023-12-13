import 'package:flutter/material.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Column(
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
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          '120 contacts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            )
          ],
        ),
      ),
    );
  }
}

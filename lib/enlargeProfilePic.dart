import 'package:flutter/material.dart';

class EnlargeProfile extends StatelessWidget {
  const EnlargeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
        child: Material(
          child: Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                ),
                Image.asset(
                  'images/profilepic.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

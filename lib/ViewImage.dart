import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  const ViewImage({super.key});

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    bool togglefav = false;
    String names = '';
    String date = '';

    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.black12.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            names,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            date,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            togglefav = !togglefav;
                          });
                        },
                        child: Icon(
                          togglefav ? Icons.star : Icons.star_border,
                          size: 50,
                          color: Colors.yellow,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.forward_rounded,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Image.network(
                      'https://images.pexels.com/photos/220429/pexels-photo-220429.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

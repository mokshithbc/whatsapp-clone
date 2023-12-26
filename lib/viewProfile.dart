import 'package:flutter/material.dart';
import 'constants.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  Widget buttons({required String bName, required IconData iconData}) {
    return Material(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      elevation: 2,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        width: 75,
        height: 75,
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  iconData,
                  size: 30, // Adjust the size as needed
                  color: Color.fromRGBO(18, 140, 126, 8),
                ),
              ),
              Text(
                bName,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    String mediaCount = '0';
    return Scaffold(
      body: SafeArea(
        child: Material(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Material(
                  elevation: 2,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 80,
                                  child: Image.asset('images/profilepic.jpg'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    contacts[index]['name'],
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: Text(
                                    contacts[index]['number'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            buttons(
                                bName: 'Audio', iconData: Icons.call_rounded),
                            Spacer(),
                            buttons(bName: 'Video', iconData: Icons.videocam),
                            Spacer(),
                            buttons(
                                bName: 'Pay', iconData: Icons.currency_rupee),
                            Spacer(),
                            buttons(bName: 'Search', iconData: Icons.search),
                            Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                contacts[index]['bio'],
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              contacts[index]['bioDate'],
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Material(
                    elevation: 3,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  'Media,Links,and docs',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  mediaCount,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: SizedBox(
                            height: 100,
                            width: double.maxFinite,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: Vimages.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 5,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      Vimages[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

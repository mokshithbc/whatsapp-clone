import 'package:flutter/material.dart';

class ChatList1 extends StatelessWidget {
  const ChatList1({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 65,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.only(left: 2, right: 5, bottom: 5),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  minLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Message",
                    prefixIcon: IconButton(
                      icon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.black.withOpacity(.5),
                      ),
                      onPressed: () {},
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(.5),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.currency_rupee,
                              color: Colors.white,
                              size: 15,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    contentPadding: EdgeInsets.all(5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CircleAvatar(
                backgroundColor: Color.fromRGBO(18, 140, 126, 8),
                radius: 25,
                child: IconButton(
                  icon: Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

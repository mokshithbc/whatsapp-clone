import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class ChatList1 extends StatefulWidget {
  const ChatList1({super.key});

  @override
  State<ChatList1> createState() => _ChatList1State();
}

class _ChatList1State extends State<ChatList1> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus && showEmoji) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Align(
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
                      focusNode: focusNode,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      minLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Message",
                        prefixIcon: IconButton(
                          icon: Icon(
                            (showEmoji == false)
                                ? Icons.emoji_emotions_outlined
                                : Icons.keyboard,
                            color: Colors.black.withOpacity(.5),
                          ),
                          onPressed: () {
                            setState(() {
                              showEmoji = !showEmoji;
                              if (showEmoji) {
                                focusNode.unfocus();
                              } else {
                                focusNode.requestFocus();
                              }
                            });
                          },
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
        ),
        if (showEmoji) emojiSelect(),
      ],
    );
  }

  Widget emojiSelect() {
    return SizedBox(
      height: 300,
      child: EmojiPicker(
        config: Config(
          columns: 7,
        ),
        onEmojiSelected: (emoji, category) {
          print(emoji);
        },
      ),
    );
  }
}

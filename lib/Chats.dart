import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ChatList1 extends StatefulWidget {
  const ChatList1({super.key});

  @override
  State<ChatList1> createState() => _ChatList1State();
}

class _ChatList1State extends State<ChatList1> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
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
    return PopScope(
      canPop: !showEmoji,
      onPopInvoked: (didPop) {
        if (!didPop) {
          showEmoji = false;
          setState(() {});
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
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
                      onChanged: (text) {
                        setState(() {});
                      },
                      controller: _controller,
                      focusNode: focusNode,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      minLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Message",
                        prefixIcon: prefixIcon(),
                        suffixIcon: suffixIcon(),
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
                        (_controller.text.isEmpty) ? Icons.mic : Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          if (focusNode.hasFocus)
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.white,
              height: 310,
            ),
          if (showEmoji) emojiSelect(),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return IconButton(
      icon: Icon(
        (showEmoji == false) ? Icons.emoji_emotions_outlined : Icons.keyboard,
        color: Colors.black.withOpacity(.5),
      ),
      onPressed: () {
        if (showEmoji) {
          showEmoji = false;
          setState(() {});

          focusNode.requestFocus();
        } else {
          focusNode.unfocus();
          showEmoji = true;
          setState(() {});
        }
      },
    );
  }

  Widget suffixIcon() {
    if (_controller.text.isNotEmpty) {
      return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.attach_file,
          color: Colors.black.withOpacity(.5),
        ),
      );
    }
    return Row(
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
    );
  }

  Widget emojiSelect() {
    return SizedBox(
      height: 310,
      child: EmojiPicker(
        config: Config(
          columns: 7,
        ),
        textEditingController: _controller,
        onBackspacePressed: () {
          if (_controller.text.isNotEmpty) {
            _controller.text =
                _controller.text.characters.skipLast(1) as String;
          }
        },
      ),
    );
  }
}

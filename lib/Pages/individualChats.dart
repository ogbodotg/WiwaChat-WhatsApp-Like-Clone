import 'dart:io';

// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/chatMessageCard.dart';
import 'package:wiwa_chat/CustomUI/replyMsgCard.dart';
import 'package:wiwa_chat/Model/MsgModel.dart';
import 'package:wiwa_chat/Model/chatModel.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualChats extends StatefulWidget {
  const IndividualChats({Key key, this.chatsModel, this.chatUser})
      : super(key: key);
  final ChatModel chatsModel;
  final ChatModel chatUser;

  @override
  _IndividualChatsState createState() => _IndividualChatsState();
}

class _IndividualChatsState extends State<IndividualChats> {
  bool showEmoji = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _textController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  IO.Socket socket;
  bool sendChatButton = false;
  List<MessageModel> messages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  void connect() {
    // Heroku host https://protected-castle-55403.herokuapp.com/
    socket = IO.io("http://192.168.43.115:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("logon", widget.chatUser.id);
    socket.onConnect((data) {
      print("connected");
      socket.on("msg", (msg) {
        print(msg);
        storeReceivedMsg("receiver", msg["msg"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendChatMsg(String msg, int chatUserId, int receiverId) {
    storeReceivedMsg("chatUser", msg);
    socket.emit("msg",
        {"msg": msg, "chatUserId": chatUserId, "receiverId": receiverId});
  }

  void storeReceivedMsg(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 70,
          titleSpacing: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back, size: 24),
                CircleAvatar(
                  child: Icon(
                      widget.chatsModel.isGroup ? Icons.groups : Icons.person,
                      color: Colors.white,
                      size: 38),
                  backgroundColor: Colors.purple[400],
                  radius: 20,
                )
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.chatsModel.name,
                      style: TextStyle(
                          fontSize: 18.5, fontWeight: FontWeight.bold)),
                  Text("last seen at 14:00", style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                PopupMenuItem(
                  child: Text("Media, links, and docs"),
                  value: "Media, links, and docs",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute notification"),
                  value: "Mute notification",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
                PopupMenuItem(
                  child: Text("More"),
                  value: "More",
                ),
              ];
            })
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(height: 70);
                        }
                        if (messages[index].type == "chatUser") {
                          return ChatMessageCard(
                            msg: messages[index].message,
                            time: messages[index].time,
                          );
                        } else {
                          return ReplyMessageCard(
                            msg: messages[index].message,
                            time: messages[index].time,
                          );
                        }
                      })),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    controller: _textController,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.length > 0) {
                                        setState(() {
                                          sendChatButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendChatButton = false;
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type your message",
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (builder) =>
                                                          bottomSheet());
                                                },
                                                icon: Icon(Icons.attach_file)),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.camera))
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(5),
                                        prefixIcon: IconButton(
                                          icon: Icon(showEmoji
                                              ? Icons.keyboard
                                              : Icons.emoji_emotions),
                                          onPressed: () {
                                            if (!showEmoji) {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                            }

                                            setState(() {
                                              showEmoji = !showEmoji;
                                            });
                                          },
                                        )),
                                  ))),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, right: 2),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.purple[400],
                              child: IconButton(
                                  onPressed: () {
                                    if (sendChatButton) {
                                      _scrollController.animateTo(
                                          _scrollController
                                              .position.maxScrollExtent,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeOut);
                                      sendChatMsg(
                                          _textController.text,
                                          widget.chatUser.id,
                                          widget.chatsModel.id);
                                      _textController.clear();
                                      setState(() {
                                        sendChatButton = false;
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    sendChatButton ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      showEmoji ? emojiSelect() : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onWillPop: () {
            if (showEmoji == true) {
              setState(() {
                showEmoji = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomSheetIcons(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(width: 40),
                  bottomSheetIcons(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(width: 40),
                  bottomSheetIcons(Icons.insert_photo, Colors.purple, "Gallery")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomSheetIcons(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(width: 40),
                  bottomSheetIcons(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(width: 40),
                  bottomSheetIcons(Icons.person, Colors.blue, "Contact")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheetIcons(IconData icon, Color bgColor, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: bgColor,
            radius: 30,
            child: Icon(icon, size: 29, color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      onEmojiSelected: (emoji, category) {
        print(emoji);
        setState(() {
          _textController.text = _textController.text + emoji.emoji;
        });
      },
    );
  }
}

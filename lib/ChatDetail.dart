
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';

class ChatDetail extends StatefulWidget {
  String friendName;
  String friendUid;
  ChatDetail({Key? key, required this.friendName, required this.friendUid})
      : super(key: key);

  @override
  State<ChatDetail> createState() => _ChatDetailState(friendName, friendUid);
}

class _ChatDetailState extends State<ChatDetail> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  String _friendName;
  String _friendUid;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  var chatDocId;
  var _textController = new TextEditingController();
  _ChatDetailState(this._friendName, this._friendUid);

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await chats
        .where('users', isEqualTo: {_friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
                print("iniadalah doc messages${chatDocId}");
              });

              print(chatDocId);
            } else {
              await chats.add({
                'users': {currentUserId: null, _friendUid: null},
                'names': {
                  currentUserId: FirebaseAuth.instance.currentUser?.displayName,
                  _friendUid: _friendName
                }
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'friendName': _friendName,
      'msg': msg
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: chats
          .doc("${chatDocId}")
          .collection('messages')
          .orderBy('createdOn', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading",style: TextStyle(fontSize: 15, color: Colors.lightGreen),),
          );
        }

        if (snapshot.hasData) {
          var data;
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(_friendName),
              // trailing: CupertinoButton(
              //   padding: EdgeInsets.zero,
              //   onPressed: () {
              //     print("iniadalah doc messages${chatDocId}");
              //   },
              //   child: Icon(CupertinoIcons.phone),
              // ),
              previousPageTitle: "Back",
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      reverse: true,
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          data = document.data()!;
                          print(document.toString());
                          print(data['msg']);
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ChatBubble(
                              clipper: ChatBubbleClipper6(
                                nipSize: 0,
                                radius: 0,
                                type: isSender(data['uid'].toString())
                                    ? BubbleType.sendBubble
                                    : BubbleType.receiverBubble,
                              ),
                              alignment: getAlignment(data['uid'].toString()),
                              margin: EdgeInsets.only(top: 20),
                              backGroundColor: isSender(data['uid'].toString())
                                  ? Color(0xFF08C187)
                                  : Color(0xffE7E7ED),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(data['msg'],
                                            style: TextStyle(
                                              fontSize: 15,
                                              
                                                color: isSender(
                                                        data['uid'].toString())
                                                    ? Colors.white
                                                    : Colors.black),
                                            maxLines: 100,
                                            overflow: TextOverflow.ellipsis)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          data['createdOn'] == null
                                              ? DateTime.now().toString()
                                              : data['createdOn']
                                                  .toDate()
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: isSender(
                                                      data['uid'].toString())
                                                  ? Colors.white
                                                  : Colors.black),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: CupertinoTextField(
                            controller: _textController,
                          ),
                        ),
                      ),
                      CupertinoButton(
                          child: Icon(Icons.send_sharp),
                          onPressed: () => sendMessage(_textController.text))
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

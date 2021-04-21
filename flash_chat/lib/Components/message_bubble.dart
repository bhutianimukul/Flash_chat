import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final message;
  final isMe;

  MessageBubble(this.message, this.isMe);

  @override
  Widget build(BuildContext context) {
    Widget showTime() {
      Timestamp t = message.data()['date'];
      // var time=DateTime.fromMillisecondsSinceEpoch( );
      // Text('${ DateFormat('yyyy-MM-dd').format(
      //        )
      //     } '))
      var time = DateFormat().add_jm().format(t.toDate());
      var date = DateFormat.yMMMMd('en_US').format(t.toDate());
      return Text(
        time.toString() + '\n' + date,
        style: TextStyle(
            color: isMe ? Colors.white : Colors.lightBlueAccent, fontSize: 12),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          isMe
              ? Text('')
              : Text(
                  '${message.data()['sender']}',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))
                : BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '${message.data()['text']} ',
                  style: TextStyle(
                      fontSize: 15, color: isMe ? Colors.white : Colors.black),
                )),
          ),
          Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10), child: showTime())
        ],
      ),
    );
  }
}

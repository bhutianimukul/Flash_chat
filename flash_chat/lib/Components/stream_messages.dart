import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class StreamMessage extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final User currentUser;
  StreamMessage(this.currentUser);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').orderBy('date').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final messages = snapshot.data.docs.reversed;
            final List<MessageBubble> widgets = [];
            for (var message in messages) {
              
              widgets.add(MessageBubble(
                  message, currentUser.email == message.data()['sender']));
            }
            
            return Expanded(
              child: ListView(
               reverse: true,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                children: widgets,
              ),
            );
          }
        });
  }
}


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flash_chat/Components/stream_messages.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



  final _firestore = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
class ChatScreen extends StatefulWidget {
  static const routeName = '/chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var scrollController=ScrollController();
 
  String messageText;
final messageController=TextEditingController();
  @override
  final _auth = FirebaseAuth.instance;

//   void getUser() async{
//     try{
//       final user= await _auth.currentUser;
//       if(user!=null){
// loggedInUser=user;
//    print(loggedInUser.email);
//       }
//     }
//     catch(error){

//     }

//   }
  // void getMessages() async {
  //   final extractedData = await _firestore.collection('messages').get();

  //   for (var messages in extractedData.docs) {
  //     print(messages.data());
  //   }
  // }

  // void messageStream() async {
  //   final extractedData = _firestore.collection('messages').snapshots();
  //   await for (var snapshot in extractedData) {
  //     for (var messages in snapshot.docs) {
  //       print(messages.data());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    User loggedInUser = ModalRoute.of(context).settings.arguments;
if(loggedInUser==null){
  loggedInUser=FirebaseAuth.instance.currentUser;
}
 
    return Scaffold(
      
      appBar: AppBar(
      
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
                _auth.signOut();

                Navigator.pushReplacementNamed(context, WelcomeScreen.routeName);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            StreamMessage(loggedInUser),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      scrollController:scrollController ,
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  
                  FlatButton(
                    onPressed: () {
                    
                     
                      _firestore.collection('messages').add(
                          {'sender': loggedInUser.email, 'text': messageText , 'date': Timestamp.now()});
                      //Implement send functionality.
                      messageController.clear();
                     
                    },
                    child: Text( 
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
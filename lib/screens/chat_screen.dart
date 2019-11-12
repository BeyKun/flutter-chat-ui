import 'package:flutter/material.dart';
import 'package:flutter_chat/models/message_model.dart';
import 'package:flutter_chat/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

_buildMessage(Message message, bool isMe){
  final Container msg = Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: isMe 
        ? EdgeInsets.only(top: 7.0, bottom: 8.0, left: 80.0) 
        : EdgeInsets.only(top:8.0, bottom: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        decoration: isMe ? BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0)
          )
        ) : BoxDecoration(
          color: Color(0xFFe4f1fe),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              message.time,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 13.0,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 8.0,)
,       Text(
              message.text,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 13.0,
                fontWeight: FontWeight.w600
              )
            ),
          ],
        ),
  );
  if (isMe){
    return msg;
  }
  return Row(
    children: <Widget>[
      msg,
      IconButton(
        icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        iconSize: 30.0,
        color: message.isLiked ? Colors.red : Colors.blueGrey,
        onPressed: () {},
      ),
    ],
  );
}
 
 _buildMessageComposer() {
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 8.0),
     height: 70.0,
     color: Colors.white,
     child: Row(
       children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: 'Send a message..'
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
       ],
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 14.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    }
                  ),
                )
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
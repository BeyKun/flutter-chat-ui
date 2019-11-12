import 'package:flutter_chat/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({this.sender, this.time, this.text, this.isLiked, this.unread});

}

final User currentUser = User(id: 0, name: 'Sena', imageUrl: 'assets/images/sena.jpg');
final User yui = User(id: 1, name: 'Yui', imageUrl: 'assets/images/yui.jpg');
final User ryuu = User(id: 2, name: 'Ryuu', imageUrl: 'assets/images/ryuu.jpg');
final User suya = User(id: 3, name: 'Suya', imageUrl: 'assets/images/suya.jpg');
final User haruka = User(id: 4, name: 'Haruka', imageUrl: 'assets/images/haruka.jpg');
final User neji = User(id: 4, name: 'Neji', imageUrl: 'assets/images/neji.jpg');
final User hanabi = User(id: 4, name: 'Hanabi', imageUrl: 'assets/images/hanabi.jpg');
final User iruka = User(id: 4, name: 'Iruka', imageUrl: 'assets/images/iruka.jpg');

//Favorite Contacts
List<User> favorites = [yui, haruka, suya, hanabi, neji, iruka];

// Example chats on home screen
List<Message> chats = [
  Message(
    sender: yui,
    time: '5:30 PM',
    text: "Halo kaka lagi apa?",
    isLiked: false,
    unread: false
  ),
  Message(
    sender: suya,
    time: '4:30 PM',
    text: "Kak jadi latihan engga?",
    isLiked: false,
    unread: false
  ),
  Message(
    sender: haruka,
    time: '5:60 PM',
    text: "Nanti uang nya sama mamah",
    isLiked: true,
    unread: true
  ),
  Message(
    sender: ryuu,
    time: '7:30 PM',
    text: "Hayuk mabar kak",
    isLiked: false,
    unread: true
  ),
  Message(
    sender: iruka,
    time: '7:30 PM',
    text: "Perhatian bagi seluruh warga agar ikut kerja bakti",
    isLiked: false,
    unread: true
  )
];

// Example chats in chat screen
List<Message> messages = [
  Message(
    sender: yui,
    time: '5:30 PM',
    text: "Mamah kemana?",
    isLiked: false,
    unread: false
  ),
  Message(
    sender: suya,
    time: '5:35 PM',
    text: "Engga tau kak",
    isLiked: false,
    unread: false
  ),
  Message(
    sender: currentUser,
    time: '5:36 PM',
    text: "Mungkin nanti pada saatnya mamah pulang",
    isLiked: false,
    unread: true
  ),
  Message(
    sender: haruka,
    time: '5:36 PM',
    text: "Kangen sama mamah :(",
    isLiked: false,
    unread: true
  ),
  Message(
    sender: ryuu,
    time: '7:30 PM',
    text: "Mudah-mudahan mamah cepet pulang :')",
    isLiked: false,
    unread: true
  )
];
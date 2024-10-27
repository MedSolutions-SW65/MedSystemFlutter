import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medsystem_app/services/auth/auth_service.dart';
import 'package:medsystem_app/services/chat/chat_service.dart';
//import 'package:path/path.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverId;

  ChatPage({super.key, required this.receiverEmail, required this.receiverId});

  // text controller for the message input field
  final TextEditingController _messageController = TextEditingController();

  //chat & auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  // send message
  void sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      //send message
      await _chatService.sendMessage(receiverId, _messageController.text);

      //clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(receiverEmail)),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: _buildMessageList(),
          ),
          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverId, senderId),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //return list view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data['message']);
  }

  //build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: const InputDecoration(hintText: "Type a message"),
            obscureText: false,
          ),
        ),
        IconButton(
            onPressed: sendMessage, icon: const Icon(Icons.arrow_upward)),
      ],
    );
  }
}

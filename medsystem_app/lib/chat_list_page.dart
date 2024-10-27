import 'package:flutter/material.dart';
import 'package:medsystem_app/components/user_tile.dart';
import 'package:medsystem_app/pages/chat_page.dart';
import 'package:medsystem_app/services/auth/auth_service.dart';
import 'package:medsystem_app/services/chat/chat_service.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});

  //Services
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat",
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: _builderList(),
    );
  }

  Widget _builderList() {
    return StreamBuilder(
      stream: chatService.getUsersStream(),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        //data
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _builderListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _builderListItem(Map<String, dynamic> userData, BuildContext context) {
    // display all users
    if (userData['email'] != authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverEmail: userData['email'],
                        receiverId: userData['uid'],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hw4/services/authentication/auth_service.dart';
import 'package:hw4/services/chat/chat_service.dart';
import 'package:hw4/components/my_textfield.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String recieverID;

  ChatPage({super.key, required this.receiverEmail, required this.recieverID});

  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(recieverID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with $receiverEmail")),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          // user input
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(recieverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Error loading messages"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextfield(
            controller: _messageController,
            hintText: "Type a message",
            obscureText: false,
          ),
        ),
        IconButton(icon: const Icon(Icons.send), onPressed: sendMessage),
      ],
    );
  }
}

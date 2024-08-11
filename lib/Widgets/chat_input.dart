import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onUpload; // Added for handling file upload

  const ChatInput({
    Key? key,
    required this.controller,
    required this.onSend,
    required this.onUpload, // Added for handling file upload
  }) : super(key: key);

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  bool _isSending = false;

  void _handleSend() {
    setState(() {
      _isSending = true;
    });

    widget.onSend();

    // Clear the input field after sending the message
    widget.controller.clear();

    // Simulate the AI processing and then re-enable the send button
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSending = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the TextField
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.upload_file, color: Colors.blueAccent),
              onPressed: widget.onUpload, // File upload button
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: 'Enter your medical query...',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  // Removing the suffixIcon to avoid layout issues
                ),
                minLines: 1,
                maxLines: 4,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send, color: _isSending ? Colors.grey : Colors.blueAccent),
              onPressed: _isSending ? null : _handleSend,
            ),
          ],
        ),
      ),
    );
  }
}

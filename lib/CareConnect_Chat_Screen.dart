import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_gpt/Utils/snackbars.dart';
import 'package:gemini_gpt/Widgets/chat_header.dart';
import 'package:gemini_gpt/Widgets/chat_input.dart';
import 'package:gemini_gpt/Widgets/chat_profile.dart';
import 'package:gemini_gpt/Widgets/message.dart';
import 'package:gemini_gpt/Widgets/message_widget.dart';
import 'package:gemini_gpt/Widgets/typing_indicator.dart';
import 'package:gemini_gpt/careconnect_health_ai_bot.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class CareConnectChatScreen extends ConsumerStatefulWidget {
  const CareConnectChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CareConnectChatScreen> createState() => _CareConnectChatScreenState();
}

class _CareConnectChatScreenState extends ConsumerState<CareConnectChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;
  final CareConnect_health_ai_service _careConnectService = CareConnect_health_ai_service();

  Future<void> callCareConnectModel() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add(Message(text: _controller.text, isUser: true));
      _isLoading = true;
    });

    try {
      final responseText = await _careConnectService.generateResponse(_controller.text.trim());
      setState(() {
        _messages.add(Message(
          text: responseText,
          isUser: false,
        ));
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _messages.add(Message(text: 'An error occurred: $e', isUser: false));
        _isLoading = false;
      });
      SnackbarUtils.showErrorSnackbar(context);
    }

    _controller.clear();
  }

  void _handleFeedback(int messageIndex, bool isThumbsUp) {
    if (isThumbsUp) {
      SnackbarUtils.showThumbsUpSnackbar(context);
    } else {
      SnackbarUtils.showThumbsDownSnackbar(context);
    }

    setState(() {
      _messages[messageIndex] = _messages[messageIndex].copyWith(
        feedback: isThumbsUp ? '👍' : '👎',
      );
    });
  }

  Future<void> _handleUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      File fileToUpload = File(file.path!);

      // Show the uploaded file as a message from the user
      setState(() {
        _messages.add(Message(
          text: 'Uploaded: ${file.name}',
          isUser: true,
        ));
        _isLoading = true;  // Show typing indicator
      });

      try {
        // Analyze the file content as a prompt
        final responseText = await _careConnectService.analyzeFile(fileToUpload);

        setState(() {
          _messages.add(Message(
            text: responseText,
            isUser: false,
          ));
          _isLoading = false;  // Hide typing indicator
        });
      } catch (e) {
        setState(() {
          _messages.add(Message(text: 'An error occurred: $e', isUser: false));
          _isLoading = false;
        });
        SnackbarUtils.showErrorSnackbar(context);
      }
    } else {
      setState(() {
        _messages.add(Message(
          text: 'File upload canceled.',
          isUser: true,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ChatHeader(),
      body: Column(
        children: [
          const ChatProfile(),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatMessage(
                  message: message,
                  onThumbsUpPressed: () => _handleFeedback(index, true),
                  onThumbsDownPressed: () => _handleFeedback(index, false),
                );
              },
            ),
          ),
          if (_isLoading) const TypingIndicator(),  // Show typing indicator when loading
          ChatInput(
            controller: _controller,
            onSend: callCareConnectModel,
            onUpload: () => _handleUpload(context),
          ),
        ],
      ),
    );
  }
}

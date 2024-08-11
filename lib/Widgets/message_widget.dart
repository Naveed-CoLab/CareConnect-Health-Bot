
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini_gpt/Widgets/handle_feedback.dart';
import 'package:gemini_gpt/Widgets/message.dart';

class ChatMessage extends StatelessWidget {
  final Message message;
  final VoidCallback onThumbsUpPressed;
  final VoidCallback onThumbsDownPressed;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.onThumbsUpPressed,
    required this.onThumbsDownPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: message.isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: message.isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              if (!message.isUser)
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/dr_ai_chatbot.jpeg'),
                  radius: 15,
                ),
              const SizedBox(width: 10),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  decoration: BoxDecoration(
                    color: message.isUser
                        ? const Color(0xFF0069fc)
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: message.imageFile != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.file(
                              message.imageFile!,
                              width: double.infinity,
                              height: 200.0, // Adjust height if needed
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(child: Text('Image failed to load'));
                              },
                            ),
                            const SizedBox(height: 8.0),
                            MarkdownBody(
                              data: message.text ?? '',
                              selectable: true,
                              styleSheet: MarkdownStyleSheet(
                                p: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: message.isUser
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          ],
                        )
                      : MarkdownBody(
                          data: message.text ?? '',
                          selectable: true,
                          styleSheet: MarkdownStyleSheet(
                            p: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: message.isUser
                                      ? Colors.white
                                      : Colors.black,
                                ),
                          ),
                        ),
                ),
              ),
              if (message.isUser) const SizedBox(width: 10),
              if (message.isUser)
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/user_picture.jpg'),
                  radius: 15,
                ),
            ],
          ),
          if (!message.isUser && message.text != null)
            FeedbackRow(
              onThumbsUpPressed: onThumbsUpPressed,
              onThumbsDownPressed: onThumbsDownPressed,
            ),
        ],
      ),
    );
  }
}

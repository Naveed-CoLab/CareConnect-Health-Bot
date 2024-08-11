import 'dart:io';

class Message {
  final String? text;
  final File? imageFile;
  final bool isUser;
  final String? feedback;

  Message({
    this.text,
    this.imageFile,
    required this.isUser,
    this.feedback,
  });

  // Method to copy with new values
  Message copyWith({String? text, File? imageFile, bool? isUser, String? feedback}) {
    return Message(
      text: text ?? this.text,
      imageFile: imageFile ?? this.imageFile,
      isUser: isUser ?? this.isUser,
      feedback: feedback ?? this.feedback,
    );
  }
}

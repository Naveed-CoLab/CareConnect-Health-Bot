import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

Future<void> _handleUpload(BuildContext context) async {
  final ImagePicker picker = ImagePicker();

  try {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File imageFile = File(image.path);
      print('Image selected: ${imageFile.path}'); // For debugging purposes

      // Display image in chat
      _addChatMessage(context, text: 'Image file uploaded', imagePath: imageFile.path);
    } else {
      print('Image picking canceled.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image picking canceled.')),
      );
    }
  } catch (e) {
    print('An error occurred while picking the image: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred: $e')),
    );
  }
}

void _addChatMessage(BuildContext context, {required String text, String? imagePath}) {
  // Add chat message with image to your chat list or message widget
}

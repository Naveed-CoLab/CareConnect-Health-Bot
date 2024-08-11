import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedbackRow extends StatelessWidget {
  final VoidCallback onThumbsUpPressed;
  final VoidCallback onThumbsDownPressed;

  const FeedbackRow({
    Key? key,
    required this.onThumbsUpPressed,
    required this.onThumbsDownPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensure the row takes up only as much space as needed
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.hand_thumbsup, size: 20, color: Colors.grey),
            onPressed: onThumbsUpPressed,
          ),
          const SizedBox(width: 4), // Reduce space between thumbs up and thumbs down
          IconButton(
            icon: const Icon(CupertinoIcons.hand_thumbsdown, size: 20, color: Colors.grey),
            onPressed: onThumbsDownPressed,
          ),
        ],
      ),
    );
  }
}

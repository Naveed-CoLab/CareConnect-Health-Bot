import 'package:flutter/material.dart';
import 'package:gemini_gpt/Themes/CareConnect_themes.dart';

class ChatHeader extends StatelessWidget implements PreferredSizeWidget {
  const ChatHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.2; // 20% of screen width for the image
    final imageHeight = imageWidth * (52 / 85); // Maintain aspect ratio of the image

    return AppBar(
      centerTitle: true,
      backgroundColor: CareconnectThemes.primaryColor,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              'assets/chatbot_photo.png',
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              'AI Health Bot',
              style: CareconnectThemes.titleTextStyle.copyWith(
                color: CareconnectThemes.textColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6AB4C8),
              Color(0xFF3D99B3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert, // Example icon
            color: CareconnectThemes.textColor,
            size: screenWidth * 0.07, // Icon size adjusts with screen width
          ),
        ),
        SizedBox(width: screenWidth * 0.03), // Adjust padding based on screen size
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

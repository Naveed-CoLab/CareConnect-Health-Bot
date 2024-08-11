import 'package:flutter/material.dart';
import 'package:gemini_gpt/Themes/CareConnect_themes.dart';


class OnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final VoidCallback onContinue;

  const OnboardingScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: CareconnectThemes.titleTextStyle,
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: CareconnectThemes.subtitleTextStyle,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Image.asset(
              imageAsset,
              height: 300,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: onContinue,
              style: CareconnectThemes.elevatedButtonStyle,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                      color: CareconnectThemes.textColor,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: CareconnectThemes.textColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: CareconnectThemes.primaryColor,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gemini_gpt/CareConnect_Chat_Screen.dart';
import 'package:gemini_gpt/OnBoarding_Screens/widget/onboarding_widget.dart';


class Onboarding_3 extends StatelessWidget {
  const Onboarding_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      title: '24/7 AI Doctor Assistance',
      description: 'Access reliable and instant medical advice anytime, anywhere with our AI-powered virtual doctor.',
      imageAsset: 'assets/onboarding_3.png',
      onContinue: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const CareConnectChatScreen()),
          (route) => false,
        );
      },
    );
  }
}

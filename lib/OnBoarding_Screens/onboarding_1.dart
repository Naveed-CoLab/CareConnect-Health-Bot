import 'package:flutter/material.dart';
import 'package:gemini_gpt/OnBoarding_Screens/onboarding_2.dart';
import 'package:gemini_gpt/OnBoarding_Screens/widget/onboarding_widget.dart';


class Onboarding_1 extends StatelessWidget {
  const Onboarding_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      title: 'Medical Chatbots',
      description: 'Assist patients with medical inquiries using AI-powered chatbots.',
      imageAsset: 'assets/onboarding_1.png',
      onContinue: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding_2()),
          (route) => false,
        );
      },
    );
  }
}

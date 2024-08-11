import 'package:flutter/material.dart';
import 'package:gemini_gpt/OnBoarding_Screens/onboarding_3.dart';
import 'package:gemini_gpt/OnBoarding_Screens/widget/onboarding_widget.dart';


class Onboarding_2 extends StatelessWidget {
  const Onboarding_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      title: 'Personalized Health Insights',
      description: 'Get tailored health recommendations and insights based on your unique medical history and current symptoms.',
      imageAsset: 'assets/onboarding_2.png',
      onContinue: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Onboarding_3()),
          (route) => false,
        );
      },
    );
  }
}

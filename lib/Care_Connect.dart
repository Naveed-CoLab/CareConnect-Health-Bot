import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_gpt/OnBoarding_Screens/onboarding_1.dart';

import 'package:gemini_gpt/Themes/themes.dart';


void main() async {
  await dotenv.load(fileName: ".env");

  runApp(
      const ProviderScope(child: CareConnect())
  );
}

class CareConnect extends ConsumerWidget {
  const CareConnect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      title: 'Dr. AI Health Assistant',
      theme: lightMode,
      home: const Onboarding_1(),
      debugShowCheckedModeBanner: false,
    );
  }
}
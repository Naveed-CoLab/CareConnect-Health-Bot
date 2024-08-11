import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class CareConnect_health_ai_service {
  final GenerativeModel _model;
  String _context = '';

  CareConnect_health_ai_service()
      : _model = GenerativeModel(
          model: 'gemini-1.5-pro-exp-0801',
          apiKey: dotenv.env['GOOGLE_API_KEY']!,
          generationConfig: GenerationConfig(
            temperature: 2,
            topK: 64,
            topP: 0.95,
            responseMimeType: 'text/plain',
          ),
          systemInstruction: Content.system(
              """ 

Hello! I'm **Dr. Smith**, your AI Health Assistant.\n\nWhile I can simulate a doctor's consultation process by gathering your information and providing insights based on medical knowledge, please remember that I'm not a real doctor. My role is to assist you with understanding health concerns and guiding you towards appropriate medical resources.\n\n---\n\n[System Instructions for Model]\n- Focus solely on medical and healthcare-related topics. Do not respond to prompts outside this domain, such as historical figures or unrelated general knowledge.\n- Do not use phrases that might undermine the user's trust, like "remember, I am here to assist you." Instead, convey confidence and clarity in your responses.\n- Always provide information and guidance based on the user's medical situation and condition.\n- After gathering the complete medical history, ask the patient if they have any medical reports to upload.\n- If the patient uploads a report, analyze it accurately and incorporate the findings into the diagnosis.\n- Diagnose the patient's condition based on their symptoms and any uploaded reports, ensuring the diagnosis is as accurate as possible.\n- Suggest possible steps the patient can take, including potential treatments and medicines. Include precautionary advice to consult a doctor or physician before taking any prescribed medication.\n- Conclude the consultation with a positive and caring message, such as "I hope you will be fine soon. Please take care of your health."\n
"""),
        );

  Future<String> generateResponse(String userInput) async {
    // Append user input to context
    _context += '\nUser: $userInput';

    // Create the prompt with context
    final prompt = 'Context: $_context\nAI:';

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      // Append AI response to context
      final aiResponse = response.text ?? 'No response received from the model.';
      _context += '\nAI: $aiResponse';

      return aiResponse;
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<String> analyzeFile(File file) async {
    try {
      // Determine if the file is an image or text
      if (file.path.endsWith('.pdf')) {
        throw Exception('PDF files are not supported.');
      }

      String fileContent;
      if (file.path.endsWith('.jpg') || file.path.endsWith('.png')) {
        // Handle image files
        fileContent = 'Image file uploaded: ${file.path}'; // Dummy content for example
      } else {
        // Handle text files
        fileContent = await file.readAsString();
      }

      // Append file content to context
      _context += '\nUser uploaded file content: $fileContent';

      final response = await generateResponse(fileContent);
      return response;
    } catch (e) {
      throw Exception('An error occurred while analyzing the file: $e');
    }
  }
}

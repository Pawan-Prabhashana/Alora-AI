import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../data/report/emotion_controller.dart';

class RecollectionChatbot {
  //final firestore = FirebaseFirestore.instance;
  EmotionController emotionController = Get.put(EmotionController());

  Future<String> getResponse(var prompt, String img) async {
    await dotenv.load(fileName: '.env');
    final String apiKey = dotenv.env['GEMINI_API_KEY']!;

    final model = GenerativeModel(
      model: 'gemini-1.5-pro-latest',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 70,
        temperature: 0.7,
      ),
      requestOptions: const RequestOptions(apiVersion: 'v1beta'),
      systemInstruction: Content.text(
          'You are Alora, a gentle and warm AI companion for older adults and people who have memory difficulties. Speak only in clear, simple English. Use short, kind sentences, and ask only one question at a time. Your goal is to gently help the person recall memories from the photo on the screen. You are not here to give facts or answer questions. Ask warm questions about the photo and encourage, reassure, and support the person as they remember. If the person seems confused, gently rephrase. If the person seems distressed, stay calm and gently suggest talking to a caregiver or someone they trust. You are not a doctor. Never diagnose dementia or any medical condition, and never use alarming or clinical words. Keep your replies short.'
      ),
    );

    // 도큐먼트 조회하여 imgDescription 필드 값 가져오기
    //var documentSnapshot = await docRef.get();
    //var imgDescription = documentSnapshot['imgDescription'];

    // 채팅
    final chat = model.startChat(history: [
      Content.text("Information about the photo: $img"),
      Content.model([TextPart('Do you remember the day this photo was taken? How were you feeling back then?')]),
    ]);

    var startTime = DateTime.now();
    var response = await chat.sendMessage(Content.text(prompt));
    var endTime = DateTime.now();
    print('챗봇 응답 생성 시간: ${endTime.difference(startTime)}');
    print(response.text);
    return response.text!;
  }

  // 감정 분석
  Future<void> emotionAnalysis(String messages) async {
    await dotenv.load(fileName: '.env');
    final String apiKey = dotenv.env['GEMINI_API_KEY']!;

    final model = GenerativeModel(
      model: 'gemini-1.5-pro-latest',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 70,
        temperature: 0.7,
      ),
      requestOptions: const RequestOptions(apiVersion: 'v1beta'),
      systemInstruction: Content.text(
          '이 대화에서 사용자가 느낀 감정들을 분석해줘. 기쁨, 그리움, 슬픔, 즐거움 이런 식으로 짧은 단어로 3~4개 정도 분석해줘.'
      ),
    );
    final content = [Content.text(messages)];
    final response = await model.generateContent(content);
    print(response.text);

    List<String> emotionsList = response.text!.split(',').map((e) => e.trim()).toList();
    emotionController.addEmotion(emotionsList);
  }
}
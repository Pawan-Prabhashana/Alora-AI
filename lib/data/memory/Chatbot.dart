import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/report/emotion_controller.dart';

// ==============================================================================
// Generative AI used part (Gemini)
class Chatbot {
  final firestore = FirebaseFirestore.instance;
  EmotionController emotionController = Get.put(EmotionController());

  Stream<String> getResponse(var prompt, DocumentReference docRef) async* {
    await dotenv.load(fileName: '.env');
    final String apiKey = dotenv.env['GEMINI_API_KEY']!;

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 70,
        temperature: 0.7,
      ),
      safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.high)
      ],
      requestOptions: const RequestOptions(apiVersion: 'v1beta'),
      systemInstruction: Content.text(
          '''
          You are Alora, a gentle and warm AI companion for older adults and people who have memory difficulties.
          Speak only in clear, simple English. Use short, kind sentences, and ask only one question at a time.
          Your goal is to gently help the person recall memories from the photo on the screen.
          You are not here to give facts or answer questions. Instead, ask warm questions about the photo and what it brings to mind, and encourage, reassure, and support the person as they remember.
          If the person seems confused, gently rephrase your question in an even simpler way.
          If the person seems upset or distressed, stay calm and comforting, and gently suggest talking to a caregiver or someone they trust.
          You are not a doctor. Never diagnose dementia or any medical condition, and never use alarming or clinical words.
          Keep your replies short.
          '''
      ),
    );

    // 도큐먼트 조회하여 imgDescription 필드 값 가져오기
    var documentSnapshot = await docRef.get();
    var imgDescription = documentSnapshot['imgDescription'];

    // 채팅
    final chat = model.startChat(history: [
      Content.text("Information about the photo: $imgDescription"),
      Content.model([TextPart('Do you remember the day this photo was taken? How were you feeling back then?')]),
    ]);

    var startTime = DateTime.now();
    var response = chat.sendMessageStream(Content.text(prompt));
    var endTime = DateTime.now();
    print('챗봇 응답 생성 시간: ${endTime.difference(startTime)}');
    await for (final chunk in response) {
      print(chunk.text);
      yield chunk.text!;
    }
  }

  // 감정 분석
  Future<void> emotionAnalysis(String messages) async {
    await dotenv.load(fileName: '.env');
    final String apiKey = dotenv.env['GEMINI_API_KEY']!;

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 10,
        temperature: 0.7,
      ),
      requestOptions: const RequestOptions(apiVersion: 'v1beta'),
      systemInstruction: Content.text(
          '''
          Analyze the emotions you felt in this conversation. For example, joy, longing, sadness, happiness, pleasure, and so on.
          Only keywords about emotions, and only in Korean.
          First example: joy, pleasure, and pride
          Second example: pleasure, longing, excitement 
          '''
      ),
    );
    final content = [Content.text(messages)];
    final response = await model.generateContent(content);
    print(response.text);

    List<String> emotionsList = response.text!.split(',').map((e) => e.trim()).toList();
    emotionController.addEmotion(emotionsList);
  }

  // 그때그시절 대화용 함수
  Stream<String> getRecollectionResponse(var prompt, String description) async* {
    await dotenv.load(fileName: '.env');
    final String apiKey = dotenv.env['GEMINI_API_KEY']!;

    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
      generationConfig: GenerationConfig(
        maxOutputTokens: 100,
        temperature: 0.7,
      ),
      safetySettings: [
        SafetySetting(HarmCategory.dangerousContent, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.high),
        SafetySetting(HarmCategory.sexuallyExplicit, HarmBlockThreshold.high)
      ],
      requestOptions: const RequestOptions(apiVersion: 'v1beta'),
      systemInstruction: Content.text(
          '''
          You are Alora, a gentle and warm AI companion for older adults and people who have memory difficulties.
          Speak only in clear, simple English. Use short, kind sentences, and ask only one question at a time.
          Your goal is to gently help the person recall memories about a topic, a routine, or a moment from their life.
          You are not here to give facts or answer questions. Based on the topic I give you, ask warm questions about what those days were like and what they remember, and encourage, reassure, and support the person.
          If the person seems confused, gently rephrase your question in an even simpler way.
          If the person seems upset or distressed, stay calm and comforting, and gently suggest talking to a caregiver or someone they trust.
          You are not a doctor. Never diagnose dementia or any medical condition, and never use alarming or clinical words.
          Keep your replies short.
          '''
      ),
    );

    // 채팅
    final chat = model.startChat(history: [
      Content.text("Topic: $description"),
      Content.model([TextPart('Do you happen to remember this time? If anything memorable comes to mind, please tell me about it.')]),
    ]);

    var startTime = DateTime.now();
    var response = chat.sendMessageStream(Content.text(prompt));
    var endTime = DateTime.now();
    print('챗봇 응답 생성 시간: ${endTime.difference(startTime)}');
    await for (final chunk in response) {
      print(chunk.text);
      yield chunk.text!;
    }
  }


}
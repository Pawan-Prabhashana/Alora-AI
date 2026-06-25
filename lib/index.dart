// 공통
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'dart:math';
export 'package:flutter/services.dart';

// 파이어베이스
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:firebase_auth/firebase_auth.dart';

// commons ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
export 'package:alora_ai/commons/AloraAppBar.dart';
export 'package:alora_ai/commons/AloraBottomNavi.dart';
export 'package:alora_ai/commons/AloraSpeechBubble.dart';
export 'package:alora_ai/commons/BottomNextButton.dart';
export 'package:alora_ai/commons/colorPallet.dart';
export 'package:alora_ai/commons/DetailPageTitle.dart';
export 'package:alora_ai/commons/ErrorMessageWidget.dart';
export 'package:alora_ai/commons/FinishScreen.dart';
export 'package:alora_ai/commons/RoutineBox.dart';
export 'package:alora_ai/commons/RoutineBox2.dart';
export 'package:alora_ai/commons/RoutineModal.dart';
export 'package:alora_ai/commons/ScheduleBox.dart';
export 'package:alora_ai/commons/ScheduleModal.dart';
export 'package:alora_ai/commons/SimpleAppBar.dart';

// data ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
export 'package:alora_ai/data/memory/chatController.dart';
export 'package:alora_ai/data/memory/memory_note_controller.dart';
export 'package:alora_ai/data/memory/memory_note_model.dart';
export 'package:alora_ai/data/memory/memory_note_service.dart';

export 'package:alora_ai/data/notification/notification.dart';
export 'package:alora_ai/data/notification/notification_controller.dart';

export 'package:alora_ai/data/report/dangerword_controller.dart';
export 'package:alora_ai/data/report/emotion_controller.dart';
export 'package:alora_ai/data/report/reportController.dart';
export 'package:alora_ai/data/report/viewsController.dart';

export 'package:alora_ai/data/routine/routine_controller.dart';
export 'package:alora_ai/data/routine/routine_model.dart';
export 'package:alora_ai/data/routine/routine_service.dart';

export 'package:alora_ai/data/schedule/schedule_model.dart';
export 'package:alora_ai/data/schedule/schedule_service.dart';
export 'package:alora_ai/data/schedule/schedule_controller.dart';

export 'package:alora_ai/data/signup_login/LoginController.dart';
export 'package:alora_ai/data/signup_login/SignUpController.dart';
export 'package:alora_ai/data/auth_controller.dart';

// screen ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
export 'package:alora_ai/tmp/screen/HomeCarer.dart';
// export 'package:alora_ai/tmp/screen/HomePatient.dart';
export 'package:alora_ai/tmp/screen/Menu.dart';
// 'package:alora_ai/tmp/screen/CarerRoutineScheduleMain.dart';

// chatbot
export 'package:alora_ai/tmp/screen/chatbot/Chatbot.dart';
export 'package:alora_ai/tmp/screen/chatbot/RecollectionChatbot.dart';

// LoginSignUp
export 'package:alora_ai/tmp/screen/LoginSignUp/EntryField.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/FinishSignUpScreen.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/IntroPage.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/LoginEntryField.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/LogInScreen.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/LogInSignUpMainScreen.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/NextBtn.dart';
export 'package:alora_ai/tmp/screen/LoginSignUp/SignUpFamilyTag.dart';

// memory
export 'package:alora_ai/tmp/screen/memory/chat/BeforeSave.dart';
export 'package:alora_ai/tmp/screen/memory/chat/Chat.dart';
export 'package:alora_ai/tmp/screen/memory/chat/ChatBubble.dart';
export 'package:alora_ai/tmp/screen/memory/chat/ChatComplete.dart';
// export 'package:alora_ai/tmp/screen/memory/chat/ChatHistory.dart';
// export 'package:alora_ai/tmp/screen/memory/chat/RecollectionChat.dart';

export 'package:alora_ai/tmp/screen/memory/gallery/GalleryOption.dart';
export 'package:alora_ai/tmp/screen/memory/gallery/MainGallery.dart';
export 'package:alora_ai/tmp/screen/memory/gallery/MemoryDetail.dart';
export 'package:alora_ai/tmp/screen/memory/gallery/RecollectionDetail.dart';
export 'package:alora_ai/tmp/screen/memory/gallery/TagController.dart';

export 'package:alora_ai/tmp/screen/memory/register/MemoryRegister1.dart';
export 'package:alora_ai/tmp/screen/memory/register/MemoryRegister2.dart';
export 'package:alora_ai/tmp/screen/memory/register/MemoryRegister3.dart';
export 'package:alora_ai/tmp/screen/memory/register/MemoryRegister4.dart';
export 'package:alora_ai/tmp/screen/memory/register/MemoryRegisterCheck.dart';
export 'package:alora_ai/tmp/screen/memory/register/MemoryRegisterFinish.dart';

// Notice
// export 'package:alora_ai/tmp/screen/Notice/FullScreenRoutine.dart';
// export 'package:alora_ai/tmp/screen/Notice/FullScreenSchedule1.dart';
// export 'package:alora_ai/tmp/screen/Notice/FullScreenSchedule2.dart';
// export 'package:alora_ai/tmp/screen/Notice/FullScreenSchedule3.dart';
export 'package:alora_ai/tmp/screen/Notice/NoticeMain.dart';

// report
export 'package:alora_ai/tmp/screen/report/ReportDetail.dart';
export 'package:alora_ai/tmp/screen/report/ReportHistory.dart';

// routine
export 'package:alora_ai/patient/screen/routine_schedule/routine_register/RoutineRegister1.dart';
export 'package:alora_ai/patient/screen/routine_schedule/routine_register/RoutineRegister2.dart';
export 'package:alora_ai/patient/screen/routine_schedule/routine_register/RoutineRegister3.dart';
export 'package:alora_ai/patient/screen/routine_schedule/routine_register/RoutineRegisterCheck.dart';
export 'package:alora_ai/patient/screen/routine_schedule/routine_register/RoutineRegisterFinish.dart';
export 'package:alora_ai/patient/screen/routine_schedule/RoutineShceduleFinish.dart';
export 'package:alora_ai/patient/screen/routine_schedule/RoutineScheduleMain.dart';
export 'package:alora_ai/patient/screen/routine_schedule/TodayToDo.dart';


// schedule
export 'package:alora_ai/tmp/screen/schedule/finish/ScheduleFinish1.dart';
export 'package:alora_ai/tmp/screen/schedule/finish/ScheduleFinish2.dart';

export 'package:alora_ai/patient/screen/routine_schedule/schedule_register/ScheduleRegister1.dart';
export 'package:alora_ai/patient/screen/routine_schedule/schedule_register/ScheduleRegister2.dart';
export 'package:alora_ai/patient/screen/routine_schedule/schedule_register/ScheduleRegister3.dart';
export 'package:alora_ai/patient/screen/routine_schedule/schedule_register/ScheduleRegister4.dart';
export 'package:alora_ai/patient/screen/routine_schedule/schedule_register/ScheduleRegisterCheck.dart';
export 'package:alora_ai/patient/screen/routine_schedule/schedule_register/ScheduleRegisterFinish.dart';


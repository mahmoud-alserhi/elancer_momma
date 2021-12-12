import 'package:elancer_momma/prefs/shared_pref_controller.dart';

class Faqs {
  late int id;
  late String questionEn;
  late String questionAr;
  late String answerEn;
  late String answerAr;


  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionAr = json['question_ar'];
    answerEn = json['answer_en'];
    answerAr = json['answer_ar'];
  }

  String get question =>
      SharedPrefController().checkLanguage == 'en' ? questionEn : questionAr;

  String get answer =>
      SharedPrefController().checkLanguage == 'en' ? answerEn : answerAr;

}





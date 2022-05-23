import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, List<String>>(
  (ref) {
    return LanguageNotifier();
  },
);

class LanguageNotifier extends StateNotifier<List<String>> {
  LanguageNotifier() : super(en);

  setLanguage(String lang) {
    switch (lang) {
      case 'en':
        state = en;
        return;
      case 'am':
        state = am;
        return;
      case 'or':
        state = or;
        return;
      case 'tg':
        state = tg;
        return;
    }
    state = en;
  }
}

List<String> en = [
  'Scan',
  'All models',
  'Languages',
  'Help',
  'Quit',
  'Adama',
  'Axum',
  'Lalibela',
  'Sheger',
  '...',
];

List<String> or = [
  'Barbaadi',
  'Modeelota Hunda',
  'Afaan Biroo',
  'Deeggarsa',
  'Cufi',
  'Adaamaa',
  'Aksuum',
  'Laalibalaa',
  'Shaggar',
  '...',
];

List<String> am = [
  'ቃኝ',
  'ሁሉም ሞዴሎች',
  'ሁሉም ቋንቋዎች',
  'እገዛ',
  'ውጣ',
  'አዳማ',
  'አክሱም',
  'ላሊበላ',
  'ሸገር',
  '...',
];

List<String> tg = [
  'ረአይ',
  'ኩሎም ሞዴላት',
  'ኩሎም ቋንቋታት',
  'ረዳኢ',
  'ዉጻእ',
  'አዳማ',
  'አኽሱም',
  'ላሊበላ',
  'ሸገር',
  '...',
];


import 'package:travelidge/app/translations/en_US/en_us_translations.dart';
import 'package:travelidge/app/translations/ko_KR/ko_kr_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>>
  translations =
  {
    'ko_KR' : koKR,
    'en_US' : enUs,
  };

}
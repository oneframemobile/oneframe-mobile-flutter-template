import 'en_US/en_us_translations.dart';
import 'tr_TR/tr_tr_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'tr_TR': trTr,
    'en_US': enUs
  };
}

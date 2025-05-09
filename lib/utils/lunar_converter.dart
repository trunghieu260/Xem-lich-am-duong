import 'package:lunar/lunar.dart';

class LunarConverter {
  static Map<String, String> convertToLunar(DateTime date) {
    final lunar = Lunar.fromDate(date);
    return {
      'day': lunar.getDay().toString(),
      'month': lunar.getMonth().toString(),
      'year': lunar.getYear().toString(),
      'canChi':
          '${lunar.getDayInGanZhi()} / ${lunar.getMonthInGanZhi()} / ${lunar.getYearInGanZhi()}',
    };
  }
}
 
import 'package:habit_tracker/core/helpers/custom_logger.dart';

import 'day.dart';
import 'streak.dart';

class Habit {
  int id;
  String name;
  int totalStreak;
  List<Day> days;

  Habit({
    required this.id,
    required this.name,
    this.totalStreak = 0,
    List<Day>? days,
  }) : days = days ?? [];

  void calculateTotalStreak() {
    for (final day in days) {
      totalStreak += day.totalStreaks;
    }
  }

  int getTotalStreak() {
    return totalStreak;
  }
}

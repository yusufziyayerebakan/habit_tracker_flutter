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

  void addDay(DateTime date) {
    Day? existingDay;
    for (var day in days) {
      if (day.date.isAtSameMomentAs(date)) {
        existingDay = day;
        break;
      }
    }

    if (existingDay == null) {
      customLogger("day added to habit id: $id");
      days.add(Day(date: date));
    }
  }

  Day? getDay(DateTime date) {
    for (var day in days) {
      if (day.date.day == date.day) {
        return day;
      }
    }

    return null;
  }

  void addStreak(DateTime date, Streak streak) {
    var day = getDay(date);
    if (day == null) {
      customLogger("day not found in habit id: $id");
      day = Day(date: date);
      addDay(date);
    }
    day.addStreak(streak);
    calculateTotalStreak();
  }

  void calculateTotalStreak() {
    for (final day in days) {
      totalStreak += day.totalStreaks;
    }
  }

  int getTotalStreak() {
    return totalStreak;
  }
}

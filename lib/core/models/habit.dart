import 'day.dart';

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

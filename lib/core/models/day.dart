import 'streak.dart';

class Day {
  DateTime date;
  List<Streak> streaks;

  Day({
    required this.date,
    List<Streak>? streaks,
  }) : streaks = streaks ?? [];

  int get totalStreaks => streaks.length;

  bool isCompleted() {
    return streaks.isNotEmpty;
  }
}

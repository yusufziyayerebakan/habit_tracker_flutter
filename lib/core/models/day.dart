import 'package:habit_tracker/core/helpers/custom_logger.dart';

import 'streak.dart';

class Day {
  DateTime date;
  List<Streak> streaks;

  Day({
    required this.date,
    List<Streak>? streaks,
  }) : streaks = streaks ?? [];

  void addStreak(Streak streak) {
    streaks.add(streak);
    streaks.sort((a, b) => a.startDate.compareTo(b.startDate));
    customLogger("streak added to day: $date, streak count: ${streaks.length}");
  }

  int get totalStreaks => streaks.length;

  bool isCompleted() {
    return streaks.isNotEmpty;
  }
}

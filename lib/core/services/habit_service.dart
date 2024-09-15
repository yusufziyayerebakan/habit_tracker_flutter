import 'package:flutter/material.dart';
import 'package:habit_tracker/core/helpers/custom_logger.dart';
import '../models/habit.dart';
import '../models/streak.dart';

class HabitService extends ChangeNotifier {
  List<Habit> habits = [];

  void addHabit(String name) {
    habits.add(Habit(id: habits.length + 1, name: name));
    notifyListeners();
  }

  List<Habit> getHabits() {
    return habits;
  }

  void addHabitStreak(Habit habit, DateTime date) {
    final index = habits.indexWhere((x) => x.id == habit.id);
    if (index != -1) {
      customLogger("addHabitStreak: $date habit id: ${habits[index].id}");
      habits[index].addStreak(date, Streak(startDate: date, endDate: date));
      customLogger(
          "habit streaks length: ${habits[index].days[0].streaks.length}");
      notifyListeners();
    }
  }

  void updateHabitName(Habit habit, String newName) {
    final index = habits.indexWhere((x) => x.id == habit.id);
    if (index != -1) {
      habits[index].name = newName;
      notifyListeners();
    }
  }

  void addCompletedDate(Habit habit, DateTime date) {
    final index = habits.indexWhere((x) => x.id == habit.id);
    if (index != -1) {
      customLogger("addCompletedDate: $date");
      habits[index].addDay(date);
      notifyListeners();
    }
  }
}

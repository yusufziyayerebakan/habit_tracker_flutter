import 'package:flutter/material.dart';
import '../models/day.dart';
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

  void addHabitStreak(int habitId, DateTime date) {
    final index = habits.indexWhere((x) => x.id == habitId);
    if (index != -1) {
      final habit = habits[index];
      final streak = Streak(startDate: date, endDate: date);
      var day = getDayOfHabitByDate(habit.days, date);
      if (day == null) {
        day = Day(date: date);
        addDayToHabit(habit.days, date);
      }

      addStreakToDay(day, streak);
      for (final day in habit.days) {
        habit.totalStreak += day.totalStreaks;
      }

      notifyListeners();
    }
  }

  void addStreakToDay(Day day, Streak streak) {
    day.streaks.add(streak);
    day.streaks.sort((a, b) => a.startDate.compareTo(b.startDate));
  }

  void addDayToHabit(List<Day> habitDays, DateTime date) {
    Day? existingDay;
    for (var day in habitDays) {
      if (day.date.isAtSameMomentAs(date)) {
        existingDay = day;
        break;
      }
    }

    if (existingDay == null) {
      habitDays.add(Day(date: date));
    }
  }

  Day? getDayOfHabitByDate(List<Day> habitDays, DateTime date) {
    for (var day in habitDays) {
      if (day.date.day == date.day) {
        return day;
      }
    }

    return null;
  }

  void updateHabitName(Habit habit, String newName) {
    final index = habits.indexWhere((x) => x.id == habit.id);
    if (index != -1) {
      habits[index].name = newName;
      notifyListeners();
    }
  }

  void addCompletedDate(int habitId, DateTime date) {
    final index = habits.indexWhere((x) => x.id == habitId);
    if (index != -1) {
      addDayToHabit(habits[index].days, date);
      notifyListeners();
    }
  }
}

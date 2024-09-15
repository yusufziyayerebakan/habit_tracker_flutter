import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/core/services/habit_service.dart';
import 'package:habit_tracker/core/models/day.dart';
import 'package:habit_tracker/core/models/streak.dart';

void main() {
  group('HabitService', () {
    late HabitService habitService;

    setUp(() {
      habitService = HabitService();
    });

    test('addHabit adds a habit to the list', () {
      habitService.addHabit('Exercise');

      expect(habitService.getHabits().length, 1);
      expect(habitService.getHabits()[0].name, 'Exercise');
    });

    test('addHabitStreak updates the streak for a habit', () {
      habitService.addHabit('Exercise');
      final habit = habitService.getHabits()[0];
      final date = DateTime.now();

      habitService.addHabitStreak(habit.id, date);

      expect(habit.days.length, 1);
      expect(habit.days[0].streaks.length, 1);
      expect(habit.days[0].streaks[0].startDate, date);
      expect(habit.days[0].streaks[0].endDate, date);
    });

    test('addStreakToDay adds a streak and sorts by startDate', () {
      final day = Day(date: DateTime.now());
      final streak1 = Streak(
          startDate: DateTime(2023, 1, 1), endDate: DateTime(2023, 1, 1));
      final streak2 = Streak(
          startDate: DateTime(2023, 1, 2), endDate: DateTime(2023, 1, 2));

      habitService.addStreakToDay(day, streak2);
      habitService.addStreakToDay(day, streak1);

      expect(day.streaks.length, 2);
      expect(day.streaks[0].startDate, streak1.startDate);
      expect(day.streaks[1].startDate, streak2.startDate);
    });

    test('addDayToHabit adds a new day to habitDays', () {
      final habitDays = <Day>[];
      final date = DateTime.now();

      habitService.addDayToHabit(habitDays, date);

      expect(habitDays.length, 1);
      expect(habitDays[0].date, date);
    });

    test('getDayOfHabitByDate returns the correct day or null', () {
      final date1 = DateTime(2023, 1, 1);
      final date2 = DateTime(2023, 1, 2);
      final habitDays = [Day(date: date1)];

      final day1 = habitService.getDayOfHabitByDate(habitDays, date1);
      final day2 = habitService.getDayOfHabitByDate(habitDays, date2);

      expect(day1?.date, date1);
      expect(day2, null);
    });

    test('updateHabitName updates the name of a habit', () {
      habitService.addHabit('Exercise');
      final habit = habitService.getHabits()[0];

      habitService.updateHabitName(habit, 'Workout');

      expect(habitService.getHabits()[0].name, 'Workout');
    });

    test('addCompletedDate adds a completed date to a habit', () {
      habitService.addHabit('Exercise');
      final habit = habitService.getHabits()[0];
      final date = DateTime.now();

      habitService.addCompletedDate(habit.id, date);

      expect(habit.days.length, 1);
      expect(habit.days[0].date, date);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/core/services/habit_service.dart';
import 'package:habit_tracker/core/models/habit.dart';

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
      final habit = Habit(id: 1, name: 'Exercise');
      habitService.addHabit(habit.name);
      final date = DateTime.now();

      habitService.addHabitStreak(habit, date);

      expect(habit.days.length, 1);
      expect(habit.days[0].streaks.length, 1);
      expect(habit.days[0].streaks[0].startDate, date);
      expect(habit.days[0].streaks[0].endDate, date);
    });

    test('updateHabitName updates the name of a habit', () {
      final habit = Habit(id: 1, name: 'Exercise');
      habitService.addHabit(habit.name);

      habitService.updateHabitName(habit, 'Workout');

      expect(habitService.getHabits()[0].name, 'Workout');
    });

    test('addCompletedDate adds a completed date to a habit', () {
      final habit = Habit(id: 1, name: 'Exercise');
      habitService.addHabit(habit.name);
      final date = DateTime.now();

      habitService.addCompletedDate(habit, date);

      expect(habit.days.length, 1);
      expect(habit.days[0].date, date);
    });
  });
}

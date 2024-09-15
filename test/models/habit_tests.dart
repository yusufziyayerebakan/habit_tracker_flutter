import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/core/models/habit.dart';
import 'package:habit_tracker/core/services/habit_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'habit_tests.mocks.dart';

@GenerateMocks([HabitService])
void main() {
  group('HabitService', () {
    late MockHabitService mockHabitService;
    late List<Habit> habits;

    setUp(() {
      mockHabitService = MockHabitService();
      habits = [Habit(id: 1, name: 'Exercise'), Habit(id: 2, name: 'Read')];
      when(mockHabitService.habits).thenReturn(habits);
    });

    test('updateHabitName updates the name of an existing habit', () {
      final habit = habits[0];
      mockHabitService.updateHabitName(habit, 'Workout');

      expect(habit.name, 'Workout');
    });

    test('updateHabitName does not change anything if habit is not in the list',
        () {
      final habit = Habit(id: 1, name: 'Meditate');
      mockHabitService.updateHabitName(habit, 'Yoga');

      expect(habits.any((h) => h.name == 'Yoga'), isFalse);
    });
  });
}

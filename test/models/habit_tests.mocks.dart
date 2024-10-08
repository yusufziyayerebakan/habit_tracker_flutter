// Mocks generated by Mockito 5.4.4 from annotations
// in habit_tracker/test/models/habit_tests.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i6;

import 'package:habit_tracker/core/models/day.dart' as _i4;
import 'package:habit_tracker/core/models/habit.dart' as _i3;
import 'package:habit_tracker/core/models/streak.dart' as _i5;
import 'package:habit_tracker/core/services/habit_service.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [HabitService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHabitService extends _i1.Mock implements _i2.HabitService {
  MockHabitService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Habit> get habits => (super.noSuchMethod(
        Invocation.getter(#habits),
        returnValue: <_i3.Habit>[],
      ) as List<_i3.Habit>);

  @override
  set habits(List<_i3.Habit>? _habits) => super.noSuchMethod(
        Invocation.setter(
          #habits,
          _habits,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void addHabit(String? name) => super.noSuchMethod(
        Invocation.method(
          #addHabit,
          [name],
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i3.Habit> getHabits() => (super.noSuchMethod(
        Invocation.method(
          #getHabits,
          [],
        ),
        returnValue: <_i3.Habit>[],
      ) as List<_i3.Habit>);

  @override
  void addHabitStreak(
    int? habitId,
    DateTime? date,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addHabitStreak,
          [
            habitId,
            date,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addStreakToDay(
    _i4.Day? day,
    _i5.Streak? streak,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addStreakToDay,
          [
            day,
            streak,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addDayToHabit(
    List<_i4.Day>? habitDays,
    DateTime? date,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addDayToHabit,
          [
            habitDays,
            date,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Day? getDayOfHabitByDate(
    List<_i4.Day>? habitDays,
    DateTime? date,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #getDayOfHabitByDate,
        [
          habitDays,
          date,
        ],
      )) as _i4.Day?);

  @override
  void updateHabitName(
    _i3.Habit? habit,
    String? newName,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #updateHabitName,
          [
            habit,
            newName,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addCompletedDate(
    int? habitId,
    DateTime? date,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #addCompletedDate,
          [
            habitId,
            date,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

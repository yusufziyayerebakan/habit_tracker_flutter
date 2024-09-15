import 'package:flutter/material.dart';

import 'screens/add_habit_screen.dart';
import 'screens/habit_list_screen.dart';
import 'theme.dart';

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: darkTheme,
      home: const HabitListScreen(),
      routes: {'/add_habit': (context) => AddHabitScreen()},
    );
  }
}

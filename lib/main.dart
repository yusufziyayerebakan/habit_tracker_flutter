import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/habit_service.dart';
import 'habit_tracker_app.dart';

void main() {
  runApp(
    ChangeNotifierProvider<HabitService>(
      create: (_) => HabitService(),
      child: const HabitTrackerApp(),
    ),
  );
}

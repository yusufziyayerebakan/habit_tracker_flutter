import 'package:flutter/material.dart';
import '../core/models/habit.dart';
import '../core/services/dialog_service.dart';
import '../screens/habit_tracker_screen.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;

  const HabitTile({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 5.0,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HabitTrackerScreen(habit: habit),
          ),
        ),
        title: Text(
          habit.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          'Day Streak: ${habit.days.length} days. Total Streak: ${habit.totalStreak} times.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.green),
          onPressed: () {
            DialogService.showEditHabitDialog(context, habit);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habit_tracker/core/models/habit.dart';
import 'package:provider/provider.dart';

import 'habit_service.dart';

class DialogService {
  static Future<void> showEditHabitDialog(BuildContext context, Habit habit) {
    final TextEditingController controller =
        TextEditingController(text: habit.name);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Habit'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Habit Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final habitService =
                    Provider.of<HabitService>(context, listen: false);
                final newName = controller.text;

                habitService.updateHabitName(habit, newName);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

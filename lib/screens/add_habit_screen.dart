import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/services/habit_service.dart';

class AddHabitScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Habit Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addHabit(context);
              },
              child: const Text('Add Habit'),
            )
          ],
        ),
      ),
    );
  }

  void _addHabit(BuildContext context) {
    final habitService = Provider.of<HabitService>(context, listen: false);

    habitService.addHabit(_controller.text);

    Navigator.pop(context);
  }
}

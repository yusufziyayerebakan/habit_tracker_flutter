import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/services/habit_service.dart';
import '../widgets/habit_tile.dart';

class HabitListScreen extends StatelessWidget {
  const HabitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitService = Provider.of<HabitService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: habitService.habits.length,
        itemBuilder: (context, index) {
          return HabitTile(
            habit: habitService.habits[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_habit');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

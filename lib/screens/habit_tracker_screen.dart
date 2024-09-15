import 'package:flutter/material.dart';
import 'package:habit_tracker/core/helpers/custom_logger.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../core/models/streak.dart';
import '../core/services/dialog_service.dart';
import '../core/services/habit_service.dart';
import '../core/models/habit.dart';

class HabitTrackerScreen extends StatefulWidget {
  final Habit habit;

  const HabitTrackerScreen({super.key, required this.habit});

  @override
  createState() => _HabitTrackerScreenState();
}

class _HabitTrackerScreenState extends State<HabitTrackerScreen> {
  late CalendarFormat _calendarFormat;
  late DateTime _selectedDay;
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2120, 12, 31),
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              eventLoader: (day) {
                final habitService =
                    Provider.of<HabitService>(context, listen: false);
                final habitDay =
                    habitService.getDayOfHabitByDate(widget.habit.days, day);
                return habitDay != null && habitDay.isCompleted()
                    ? [widget.habit]
                    : [];
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, events) {
                  final habitService =
                      Provider.of<HabitService>(context, listen: false);
                  final habitDay =
                      habitService.getDayOfHabitByDate(widget.habit.days, date);
                  final streakCount = habitDay?.totalStreaks ?? 0;

                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: streakCount > 0
                          ? Colors.blue[300]
                          : const Color.fromARGB(0, 178, 178, 178),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}\n$streakCount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: streakCount > 0
                              ? Colors.white
                              : const Color.fromARGB(255, 179, 160, 160),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
                selectedBuilder: (context, date, events) {
                  final habitService =
                      Provider.of<HabitService>(context, listen: false);
                  final habitDay =
                      habitService.getDayOfHabitByDate(widget.habit.days, date);
                  final streakCount = habitDay?.totalStreaks ?? 0;

                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}\n$streakCount',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                todayBuilder: (context, date, _) {
                  final habitService =
                      Provider.of<HabitService>(context, listen: false);
                  final habitDay =
                      habitService.getDayOfHabitByDate(widget.habit.days, date);
                  final streakCount = habitDay?.totalStreaks ?? 0;

                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}\n$streakCount',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateStreak(context);
              },
              child: const Text('Mark as Completed'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                DialogService.showEditHabitDialog(context, widget.habit);
              },
              child: const Text('Edit Habit'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateStreak(BuildContext context) {
    final habitService = Provider.of<HabitService>(context, listen: false);
    final now = DateTime.now();

    habitService.addHabitStreak(widget.habit.id, now);

    Navigator.pop(context);
  }
}

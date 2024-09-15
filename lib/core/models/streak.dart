class Streak {
  DateTime startDate;
  DateTime endDate;

  Streak({
    required this.startDate,
    required this.endDate,
  });

  bool containsDate(DateTime date) {
    return date.isAfter(startDate) && date.isBefore(endDate);
  }

  int get length => endDate.difference(startDate).inDays + 1;
}

class Task {
  final String title;
  final DateTime deadline;
  DateTime? completionDate;

  Task({
    required this.title,
    required this.deadline,
    this.completionDate,
  });

  bool get isCompleted => completionDate != null;

  bool get isCompletedBeforeDeadline =>
      isCompleted && completionDate!.isBefore(deadline);
}

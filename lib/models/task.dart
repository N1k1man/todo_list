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

  void markAsCompleted() {
    completionDate = DateTime.now();
  }
}

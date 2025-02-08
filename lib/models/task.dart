class Task {
  final String title;
  final DateTime deadline;
  final String category;
  DateTime? completionDate;

  Task({
    required this.title,
    required this.deadline,
    required this.category,
    this.completionDate,
  });

  bool get isCompleted => completionDate != null;

  void markAsCompleted() {
    completionDate = DateTime.now();
  }
}

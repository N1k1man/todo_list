import 'package:flutter/material.dart';
import '../models/task.dart';
import '../helpers/format_datetime.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggleComplete;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggleComplete,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyLargeStyle = theme.textTheme.bodyLarge!;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(task.title, style: bodyLargeStyle),
            if (task.isCompleted)
              Text(
                'Завершена: ${formatDate(task.completionDate!)}',
                style: bodyLargeStyle.copyWith(
                  color: task.completionDate!.isBefore(task.deadline)
                      ? Colors.green
                      : Colors.red,
                ),
              ),
          ],
        ),
        subtitle: Text('Дедлайн: ${formatDate(task.deadline)}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
        onTap: onToggleComplete,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo/helpers/format_datetime.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final void Function() onToggleComplete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Дедлайн: ${formatDateTime(task.deadline)}'),
          if (task.isCompleted)
            Text(
              'Завершено: ${formatDateTime(task.completionDate!)}',
              style: TextStyle(
                color:
                    task.isCompletedBeforeDeadline ? Colors.green : Colors.red,
              ),
            ),
        ],
      ),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) => onToggleComplete(),
      ),
    );
  }
}

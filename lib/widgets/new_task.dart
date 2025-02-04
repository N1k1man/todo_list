import 'package:flutter/material.dart';
import '../models/task.dart';
import '../helpers/format_datetime.dart';

class NewTask extends StatefulWidget {
  final Function(Task) onAddTask;

  const NewTask({super.key, required this.onAddTask});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final titleController = TextEditingController();
  DateTime selectedDeadline = DateTime.now().add(Duration(days: 1));

  void _saveTask() {
    if (selectedDeadline.isBefore(DateTime.now())) {
      return;
    }

    final newTask = Task(
      title: titleController.text,
      deadline: selectedDeadline,
    );

    widget.onAddTask(newTask);
    Navigator.of(context).pop();
  }

  void _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDeadline,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDeadline = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          selectedDeadline.hour,
          selectedDeadline.minute,
        );
      });
    }
  }

  void _selectTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDeadline),
    );

    if (pickedTime != null) {
      setState(() {
        selectedDeadline = DateTime(
          selectedDeadline.year,
          selectedDeadline.month,
          selectedDeadline.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Задача'),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: _selectDate,
                  child: Text('Дата: ${formatDate(selectedDeadline)}'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: _selectTime,
                  child: Text('Время: ${formatDate(selectedDeadline)}'),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _saveTask,
            child: const Text('Сохранить задачу'),
          ),
        ],
      ),
    );
  }
}

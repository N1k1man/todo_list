import 'package:flutter/material.dart';
import '../models/task.dart';

class NewTask extends StatefulWidget {
  final Function(Task) onAddTask;
  const NewTask({super.key, required this.onAddTask});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final titleController = TextEditingController();
  DateTime selectedDeadline = DateTime.now().add(Duration(days: 1));
  String selectedCategory = 'Работа';
  final List<String> categories = ['Работа', 'Покупки', 'Встречи', 'Обучение'];

  void _saveTask() {
    if (titleController.text.isEmpty) return;
    final newTask = Task(
      title: titleController.text,
      deadline: selectedDeadline,
      category: selectedCategory,
    );
    widget.onAddTask(newTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(24, 24, 24, bottomInset + 24),
        child: AlertDialog(
          title: const Text('Добавить задачу'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Название')),
              DropdownButtonFormField(
                value: selectedCategory,
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (value) => setState(() => selectedCategory = value!),
                decoration: const InputDecoration(labelText: 'Категория'),
              ),
              ElevatedButton(
                  onPressed: _saveTask, child: const Text('Добавить')),
            ],
          ),
        ),
      ),
    );
  }
}

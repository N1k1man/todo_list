import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';
import '../widgets/new_task.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Task> _tasks = [
    Task(
        title: 'Купить молоко',
        deadline: DateTime.now().add(Duration(days: 2)),
        category: 'Покупки'),
    Task(
        title: 'Созвон с клиентом',
        deadline: DateTime.now().add(Duration(days: 1)),
        category: 'Работа'),
  ];
  String selectedCategory = 'Все задачи';
  final List<String> categories = [
    'Все задачи',
    'Работа',
    'Покупки',
    'Встречи',
    'Обучение'
  ];

  void _addTask(Task task) {
    setState(() => _tasks.add(task));
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = selectedCategory == 'Все задачи'
        ? _tasks
        : _tasks.where((task) => task.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List'),
        actions: [
          DropdownButton(
            value: selectedCategory,
            items: categories
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (value) => setState(() => selectedCategory = value!),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: (ctx, i) => TaskItem(
          task: filteredTasks[i],
          onToggleComplete: () {
            setState(() {
              filteredTasks[i].markAsCompleted();
            });
          },
          onDelete: () {
            setState(() {
              _tasks.remove(filteredTasks[i]);
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => NewTask(onAddTask: _addTask),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

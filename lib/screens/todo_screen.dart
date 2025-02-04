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
        deadline: DateTime.now().add(Duration(days: 2))),
    Task(
        title: 'Позвонить маме',
        deadline: DateTime.now().add(Duration(days: 1))),
    Task(
        title: 'Сделать домашку',
        deadline: DateTime.now().add(Duration(days: 3))),
  ];

  void _toggleTaskCompletion(int index) {
    setState(() {
      final task = _tasks[index];
      if (task.isCompleted) {
        task.completionDate = null;
      } else {
        task.markAsCompleted();
      }
    });
  }

  void _addNewTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _openAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: _addNewTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO List')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (ctx, index) {
          return TaskItem(
            task: _tasks[index],
            onToggleComplete: () => _toggleTaskCompletion(index),
            onDelete: () => _deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}

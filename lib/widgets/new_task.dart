import 'package:flutter/material.dart';
import 'package:todo/helpers/format_datetime.dart';

class NewTask extends StatefulWidget {
  final void Function(String title, DateTime deadline) onTaskCreated;

  const NewTask({super.key, required this.onTaskCreated});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTime);
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 5),
      initialDate: selectedDate,
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = formatDate(pickedDate);
      });
    }
  }

  void _presentTimePicker() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        timeController.text = formatTime(pickedTime);
      });
    }
  }

  void _submitData() {
    if (_titleController.text.isEmpty) return;

    final deadline = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    widget.onTaskCreated(_titleController.text, deadline);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Название задачи'),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: dateController,
                      readOnly: true,
                      onTap: _presentDatePicker,
                      decoration:
                          const InputDecoration(labelText: 'Дата дедлайна'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: timeController,
                      readOnly: true,
                      onTap: _presentTimePicker,
                      decoration:
                          const InputDecoration(labelText: 'Время дедлайна'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Добавить задачу'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

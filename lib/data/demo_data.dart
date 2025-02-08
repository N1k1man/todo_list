import '../models/category.dart';
import '../models/task.dart';

final categories = [
  Category(id: '1', name: 'Покупки'),
  Category(id: '2', name: 'Встречи'),
  Category(id: '3', name: 'Работа'),
  Category(id: '4', name: 'Обучение'),
];

final tasks = [
  Task(id: '1', title: 'Купить молоко', category: categories[0]),
  Task(id: '2', title: 'Встреча с командой', category: categories[1]),
  Task(id: '3', title: 'Отчет по проекту', category: categories[2]),
  Task(id: '4', title: 'Изучить Flutter', category: categories[3]),
];

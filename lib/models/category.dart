import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});

  static List<Category> predefinedCategories = [
    Category(name: 'Все задачи', icon: Icons.list),
    Category(name: 'Покупки', icon: Icons.shopping_cart),
    Category(name: 'Встречи', icon: Icons.event),
    Category(name: 'Работа', icon: Icons.work),
    Category(name: 'Обучение', icon: Icons.school),
  ];
}

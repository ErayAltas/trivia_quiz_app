import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  const Category({required this.name, required this.icon, required this.color});
}

enum TaskCategoryEnum {
  working,
  training,
  reading,
  studying,
  coding,
  researching,
  other,
}

extension TaskCategoryExtension on TaskCategoryEnum {
  Category get categoryModel {
    switch (this) {
      case TaskCategoryEnum.working:
        return Category(name: TaskCategoryEnum.working.name.tr, icon: Icons.work, color: const Color(0xFFE57373));
      case TaskCategoryEnum.training:
        return Category(name: TaskCategoryEnum.training.name.tr, icon: Icons.sports_basketball, color: const Color(0xFF81C784));
      case TaskCategoryEnum.reading:
        return Category(name: TaskCategoryEnum.reading.name.tr, icon: Icons.menu_book_rounded, color: const Color(0xFF64B5F6));
      case TaskCategoryEnum.studying:
        return Category(name: TaskCategoryEnum.studying.name.tr, icon: Icons.school, color: const Color(0xFF9575CD));
      case TaskCategoryEnum.coding:
        return Category(name: TaskCategoryEnum.coding.name.tr, icon: Icons.code, color: const Color(0xFF4DB6AC));
      case TaskCategoryEnum.researching:
        return Category(name: TaskCategoryEnum.researching.name.tr, icon: Icons.search, color: Colors.yellow.shade800);
      case TaskCategoryEnum.other:
        return Category(name: TaskCategoryEnum.other.name.tr, icon: Icons.more_horiz, color: const Color(0xFFE57373));
    }
  }
}

class TaskCategoryIcon extends StatelessWidget {
  const TaskCategoryIcon({super.key, required this.categoryIndex});
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return BaseCategoryIcon(category: TaskCategoryEnum.values[categoryIndex].categoryModel);
  }
}

class BaseCategoryIcon extends StatelessWidget {
  const BaseCategoryIcon({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: category.color, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(category.icon),
      ),
    );
  }
}

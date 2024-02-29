// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';



var idFormat = const Uuid();
final formattedDate = DateFormat.yMd();

enum Category { food, travel, work, biils, laisure }

const categoryIcons = {
  Category.food: Icons.food_bank_outlined,
  Category.work: Icons.work_outline_outlined,
  Category.travel: Icons.flight_takeoff_outlined,
  Category.biils: Icons.paid_outlined,
  Category.laisure: Icons.sports_esports_outlined,
};

class Expense {
  final String id;
  final String title;
  final double price;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formattedDate.format(date);
  }

  Expense(
      {required this.category,
      required this.title,
      required this.price,
      required this.date})
      : id = idFormat.v4();
}

class expenseBucket {
  final Category category;
  final List<Expense> expenses;
  expenseBucket(this.category, this.expenses);

  expenseBucket.fotCategory(this.category, List<Expense> allExpenses)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get totalExpense {
    double sum = 0;
    for (var element in expenses) {
      sum += element.price;
    }
    return sum;
  }
}

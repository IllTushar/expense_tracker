import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatDates = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.dining,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
  Category.leisure: Icons.movie
};

class Expense {
  Expense(
      {required this.name,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String name;
  final double amount;
  final DateTime dateTime;
  final Category category;

  String get formattedDate {
    return formatDates.format(dateTime);
  }
}

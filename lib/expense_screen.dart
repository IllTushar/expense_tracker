import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense_model/expense.dart';
import 'package:expense_tracker/expense_list.dart';
class ExpenseScreen extends StatefulWidget {
  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> _registerExpense = [
    Expense(
        name: "Cinema",
        amount: 17.09,
        dateTime: DateTime.now(),
        category: Category.leisure),
    Expense(
        name: "Food",
        amount: 15,
        dateTime: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
         Expanded(child: ExpenseList(expense: _registerExpense))
        ],
      ),
    );
  }
}

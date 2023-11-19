import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense_model/expense.dart';
import 'package:expense_tracker/expense_list.dart';
import 'package:expense_tracker/bottomSheet/bottomSheetDialog.dart';

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

  void _openBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (ctx) => BottomSheetDialog());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _openBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [Expanded(child: ExpenseList(expense: _registerExpense))],
      ),
    );
  }
}

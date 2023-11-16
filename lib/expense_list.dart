import 'package:flutter/cupertino.dart';
import 'package:expense_tracker/expense_model/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) => Text(expense[index].name));
  }
}

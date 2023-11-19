import 'package:flutter/cupertino.dart';
import 'package:expense_tracker/expense_model/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expense});

  final List<Expense> expense;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: expense.length,
        itemBuilder: (context, index) => Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expense[index].name,style:GoogleFonts.aBeeZee(fontSize: 20),),
                    const SizedBox(height: 5.0,),
                    Row(
                      children: [
                        Text("\$${expense[index].amount}",style: GoogleFonts.abel(color: Colors.green),),
                        Spacer(flex: 1),
                        Icon(categoryIcons[expense[index].category]),
                        const SizedBox(width: 5.0),
                        Text(expense[index].formattedDate)
                      
                      ],
                    ),
                  ],
                ),
              ),

            ));
  }
}

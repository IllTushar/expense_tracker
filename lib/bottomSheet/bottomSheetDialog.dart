import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/expense_model/expense.dart' as category;
import 'package:google_fonts/google_fonts.dart';

class BottomSheetDialog extends StatefulWidget {
  BottomSheetDialog();

  @override
  State<BottomSheetDialog> createState() => _BottomSheetDialogState();
}

class _BottomSheetDialogState extends State<BottomSheetDialog> {
  final _newText = TextEditingController();
  final _amount = TextEditingController();
  DateTime? showDateTime;
  category.Category _selectedCategory = category.Category.leisure;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickTheDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      showDateTime = pickTheDate;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _newText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _newText,
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefix: Text('\$'), label: Text("Amount")),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(showDateTime == null
                        ? "No Date Selected"
                        : category.formatDates.format(showDateTime!)),
                    IconButton(
                        onPressed: _datePicker,
                        icon: Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(height: 18,),
              DropdownButton(
                value: _selectedCategory,
                items: category.Category.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toLowerCase(),style: GoogleFonts.aBeeZee(),),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value as category.Category;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    print(_newText.text);
                  },
                  child: const Text("Save And Continue")),
            ],
          )
        ],
      ),
    );
  }
}

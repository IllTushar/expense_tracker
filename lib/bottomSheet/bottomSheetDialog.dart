import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetDialog extends StatefulWidget {
  BottomSheetDialog();

  @override
  State<BottomSheetDialog> createState() => _BottomSheetDialogState();
}

class _BottomSheetDialogState extends State<BottomSheetDialog> {
  final _newText = TextEditingController();
  final _amount = TextEditingController();

  void _datePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year-1,now.month,now.day);
    showDatePicker(context: context,initialDate: now, firstDate: firstDate, lastDate: now);
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
      padding: EdgeInsets.all(19.0),
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
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Selected Date"),
                    IconButton(
                        onPressed: _datePicker,
                        icon: Icon(Icons.calendar_month)),
                  ],
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                print(_newText.text);
              },
              child: const Text("Save And Continue"))
        ],
      ),
    );
  }
}

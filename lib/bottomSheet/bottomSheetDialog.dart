import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetDialog extends StatelessWidget {
  BottomSheetDialog();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Title")),
          )
        ],
      ),
    );
  }
}

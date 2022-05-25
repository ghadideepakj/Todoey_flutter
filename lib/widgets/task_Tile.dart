import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final void Function(bool?)? checkBoxCallBack;
  final void Function()? longPressCallBack;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkBoxCallBack,
      this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        '$taskTitle',
        style: TextStyle(
            decoration:
                isChecked! ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallBack),
    );
  }
}

// TaskCheckBox(isChecked, (bool? checkBoxState) {
// setState(() {
// isChecked = checkBoxState;
// });
// }),

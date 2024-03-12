import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function()? longPressCallback;

  const TaskTile({
    this.isChecked,
    this.taskTitle,
    this.checkboxCallback,
    this.longPressCallback,
    super.key,
  });

  // void checkboxCallback(bool? checkboxState) {
  //   setState(() {
  //     isChecked = checkboxState ?? true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle!,
        style: TextStyle(
          decoration: isChecked! ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?) checkboxCallback;

  const TaskCheckbox(this.checkboxState, this.checkboxCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: checkboxCallback,
    );
  }
}

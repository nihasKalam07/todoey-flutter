import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final Function(bool?) checkboxCallback;
  final VoidCallback deleteTaskCallback;

  TaskTile(
      {required this.isChecked,
      required this.taskName,
      required this.checkboxCallback,
      required this.deleteTaskCallback});

  @override
  Widget build(BuildContext context) {
    //Listening to Task using consumer
    return GestureDetector(
      onLongPress: deleteTaskCallback,
      child: ListTile(
        title: Text(
          taskName,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}

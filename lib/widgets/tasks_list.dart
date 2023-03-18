import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

import '../models/task.dart';
import '../models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Listening to task data
    // taskData stands for Provider.of<TaskData>(context)
    //We specify the data type which is what we are listening for. And then it
    // simply requires a builder and the builder takes the current context that is
    // where we are in the tree. And in addition it will be able to provide the current
    // data and we can give that object a name. So that it’s going to be the data
    // that we are listening to. So I'm just simply going to call it taskData and
    // that is going to be equivalent or basically the same as calling
    // Provider.of<TaskData>(context). And finally it also takes a property
    // called “child”. And now our builder is constructed and we can simply return
    // any widgets that need to be built using this data. And now what happens is that
    // this consumer widget is going to be the one that's listening for changes
    // in taskData. So when task data updates its state then it's going to rebuild
    // this entire list view

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskName: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.updateTask(task);
              },
              deleteTaskCallback: () {
                Provider.of<TaskData>(context, listen: false).removeTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

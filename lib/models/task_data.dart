import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:todoey_flutter/models/task.dart';

//Provide this data from the MyApp widget so that it will be available app wide.
class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  //This is to avoid direct adding of task to task list. Instead force the dev to use
  //the addTask method which notifies the listeners.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  //Getter
  int get taskCount => _tasks.length;

  //Adding task through a method and calling notifyListeners inside it to
  // notify all the listeners which are listening to the tasks data.
  void addTask(String taskName) {
    _tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}

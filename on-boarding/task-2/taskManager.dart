import 'dart:io';
import 'task.dart';

class TaskManager {
  Map<String, Task> tasks = {};
  int _taskCount = 0;

  void addTask() {
    // initializing a task object
    Task newTask = Task();
    _taskCount += 1;

    // assigning ID
    String id = "T-" + _taskCount.toString();
    newTask.setId(id);

    // Adding title
    String title = "";
    while (title == "") {
      print("What is the title of your task? *This is required.");
      title = stdin.readLineSync() ?? "";
    }
    newTask.addTitle(title);

    // Adding description
    print("Enter a description for your task:");
    String? description = stdin.readLineSync();
    if (description != null) {
      newTask.addDescription(description);
    }

    // Adding due date
    print("When is the due date for the task? Use the following format DD/MM/YYYY.");
    String? date = stdin.readLineSync();
    if (date != null) {
      newTask.addDueDate(date);
    }

    tasks[id] = newTask;
    print("Task successfully created.");
    newTask.displayTask();
  }

  void updateTitle(String id) {
    // check if the task exists
    if (tasks.containsKey(id) == false) {
      print("No task with the given id exists.");
      return;
    }

    String? title;
    while (title == null) {
      print("Enter new Title:");
      title = stdin.readLineSync();
    }

    tasks[id]?.addTitle(title);
    print("Title successfully updated.");
    tasks[id]?.displayTask();
  }

  void updateStatus(String id) {
    // check if the task exists
    if (tasks.containsKey(id) == false) {
      print("No task with the given id exists.");
      return;
    }
    String status = "";
    while (status.toLowerCase() != "C" && status.toLowerCase() != "P") {
      print("What is the status of your task? 'P' for Pending or 'C' for completed");
      status = stdin.readLineSync() ?? "";
    }

    if (status == "C") {
      tasks[id]?.setStatus("Completed");
    } else {
      tasks[id]?.setStatus("Pending");
    }
    print("Status successfully updated.");
    tasks[id]?.displayTask();
  }

  void updateDescription(String id) {
    // check if the task exists
    if (tasks.containsKey(id) == false) {
      print("No task with the given id exists.");
      return;
    }

    String? description;
    print("Enter new description:");
    description = stdin.readLineSync();

    tasks[id]?.addDescription(description);
    print("Description successfully updated.");
    tasks[id]?.displayTask();
  }

  void updateDueDate(String id) {
    // check if the task exists
    if (tasks.containsKey(id) == false) {
      print("No task with the given id exists.");
      return;
    }

    String? date;
    print("Enter new due date. Use the DD/MM/YYYY format:");
    date = stdin.readLineSync();

    tasks[id]?.addDueDate(date);
    print("Due date successfully updated.");
    tasks[id]?.displayTask();
  }

  void listTasks() {
    tasks.forEach((key, value) {
      value.displayTask();
      print('');
    });
  }

  void listCompletedTasks() {
    tasks.forEach((key, value) {
      if (value.getStatus() == "Completed") {
        value.displayTask();
        print('');
      }
    });
  }

  void listPendingTasks() {
    tasks.forEach((key, value) {
      if (value.getStatus() == "Pending") {
        value.displayTask();
        print('');
      }
    });
  }

  void deleteTask(String id) {
    // check if the task exists
    if (tasks.containsKey(id) == false) {
      print("No task with the given id exists.");
      return;
    }

    Task? task = tasks[id];
    tasks.remove(id);
    print("Task successfully deleted.");
    task?.displayTask();
  }
}

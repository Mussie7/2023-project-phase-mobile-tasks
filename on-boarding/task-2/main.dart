import 'dart:io';
import 'taskManager.dart';

void main() {
  TaskManager taskManager = TaskManager();
  while (true) {
    // getting a command
    print("To add a task - 'A'");
    print("To edit a task - 'E'");
    print("To see a list of all the tasks - 'L'");
    print("To see a list of all the completed tasks - 'LC'");
    print("To see a list of all the pending tasks - 'LP'");
    print("To delete a task - 'D'");
    print("To quit - 'q'");

    String command = stdin.readLineSync() ?? "";

    // executing command
    if (command.toLowerCase() == 'a') {
      taskManager.addTask();
    } else if (command.toLowerCase() == 'l') {
      taskManager.listTasks();
    } else if (command.toLowerCase() == 'lc') {
      taskManager.listCompletedTasks();
    } else if (command.toLowerCase() == 'lp') {
      taskManager.listPendingTasks();
    } else if (command.toLowerCase() == 'd') {
      String? id;
      while (id == null) {
        print("Enter a id of the task:");
        id = stdin.readLineSync();
      }

      taskManager.deleteTask(id);
    } else if (command.toLowerCase() == 'e') {
      String? id;
      while (id == null) {
        print("Enter a id of the task:");
        id = stdin.readLineSync();
      }

      print("To edit the title - 'T'");
      print("To edit the status - 'S'");
      print("To edit the due date - 'D'");
      print("To edit the description - 'C'");

      String editCommand = stdin.readLineSync() ?? "";

      // executing edit command
      if (editCommand.toLowerCase() == 't') {
        taskManager.updateTitle(id);
      } else if (editCommand.toLowerCase() == 's') {
        taskManager.updateStatus(id);
      } else if (editCommand.toLowerCase() == 'd') {
        taskManager.updateDueDate(id);
      } else if (editCommand.toLowerCase() == 'c') {
        taskManager.updateDescription(id);
      }
    } else if (command.toLowerCase() == 'q') {
      break;
    }
  }
}

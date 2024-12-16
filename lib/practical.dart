import 'dart:io';
void main() {
  List<String> list = []; 
  bool running = true;

  while (running) {
    print('To-Do List:');
    print('1. View All Tasks');
    print('2. Add New Task');
    print('3. Delete Task');
    print('4. Update Task');
    print('5. Exit');
    print('Enter your choice (1-5): ');
    
    String choice = stdin.readLineSync()!;
    
    switch (choice) {
      case '1':
        viewTasks(list);
        break;
      case '2':
        addTask(list);
        break;
      case '3':
        deleteTask(list);
        break;
      case '4':
        updateTask(list);
        break;
      case '5':
        running = false;
        print('Exiting...');
        break;
      default:
        print('Invalid choice. Please enter a number between 1 and 5.');
    }
  }
}

void viewTasks(List<String> list) {
  if (list.isEmpty) {
    print('No tasks available.');
  } else {
    print('Current Tasks:');
    for (int i = 0; i < list.length; i++) {
      print('${i + 1}. ${list[i]}');
    }
  }
}

void addTask(List<String> list) {
  stdout.write('Enter the task you want to add: ');
  String newTask = stdin.readLineSync()!;
  list.add(newTask);
  print('Task added: "$newTask"');
}

void deleteTask(List<String> list) {
  if (list.isEmpty) {
    print('No tasks to delete.');
    return;
  }
  
  viewTasks(list);
  stdout.write('Enter the task number you want to delete: ');
  String? input = stdin.readLineSync();
  
  if (input != null && int.tryParse(input) != null) {
    int taskIndex = int.parse(input) - 1;
    if (taskIndex >= 0 && taskIndex < list.length) {
      print('Task deleted: "${list[taskIndex]}"');
      list.removeAt(taskIndex);
    } else {
      print('Invalid task number.');
    }
  } else {
    print('Invalid input.');
  }
}

void updateTask(List<String> list) {
  if (list.isEmpty) {
    print('No tasks to update.');
    return;
  }
  
  viewTasks(list);
  stdout.write('Enter the task number you want to update: ');
  String? input = stdin.readLineSync();
  
  if (input != null && int.tryParse(input) != null) {
    int taskIndex = int.parse(input) - 1;
    if (taskIndex >= 0 && taskIndex < list.length) {
      stdout.write('Enter the new task: ');
      String newTask = stdin.readLineSync()!;
      list[taskIndex] = newTask;
      print('Task updated: "$newTask"');
    } else {
      print('Invalid task number.');
    }
  } else {
    print('Invalid input.');
  }
}
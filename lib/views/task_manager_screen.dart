import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/providers/task_provider.dart';
import 'package:login_register_only/widgets/tasks/new_task_bottom_sheet.dart';
import 'package:login_register_only/widgets/tasks/tasks_list.dart';
import 'package:provider/provider.dart';

class TaskManagerScreen extends StatelessWidget {
  const TaskManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title:
            const Text('Task Mangement', style: TextStyle(color: Colors.grey)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        // child: AnimatedTasksList()
        child: TasksList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newShowGeneralDialog(context, (taskTitle) {
            if (taskTitle != "") {
              print(taskTitle);
              context
                  .read<TaskProvider>()
                  .addTask(task: TaskModel(taskTitle: taskTitle));
            }
          });
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

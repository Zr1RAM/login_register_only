import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/providers/task_provider.dart';
import 'package:login_register_only/widgets/tasks/task_widget.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;

    void deleteTask(int index) {
      final deletedTask = tasks[index];
      context.read<TaskProvider>().deleteTask(index: index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Task: ${deletedTask.taskTitle} dismissed'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              context
                  .read<TaskProvider>()
                  .addBackTask(index: index, task: deletedTask);
            },
          ),
        ),
      );
    }

    void updateTask(int index, TaskModel task) {
      context.read<TaskProvider>().updateTask(task: task, index: index);
    }

    return SingleChildScrollView(
        child: tasks.isNotEmpty
            ? Builder(builder: (context) {
                return Column(
                  children: List.generate(
                      tasks.length,
                      (index) => Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            deleteTask(index);
                          },
                          child: TaskWidget(
                            task: tasks[index],
                            onDelete: () => deleteTask(index),
                            onTaskUpdated: (updatedTask) {
                              updateTask(index, updatedTask);
                            },
                          ))),
                );
              })
            : const Center(
                child: Text(
                  'No Tasks Planned...',
                  style: TextStyle(color: Colors.grey),
                ),
              ));
  }
}

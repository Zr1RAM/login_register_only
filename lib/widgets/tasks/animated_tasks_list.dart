import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/widgets/tasks/task_widget.dart';

class AnimatedTasksList extends StatefulWidget {
  const AnimatedTasksList({super.key});

  @override
  State<AnimatedTasksList> createState() => _AnimatedTasksListState();
}

class _AnimatedTasksListState extends State<AnimatedTasksList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final tasks = List<int>.generate(4, (index) => index);

  void deleteTask(int index) {
    final removedTask = tasks.removeAt(index);
    _listKey.currentState?.removeItem(index,
        (context, animation) => _buildRemovedItem(removedTask, animation));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task ${tasks[index]} dismissed')),
    );
    // setState(() {
    //   tasks.removeAt(index);
    // });
    print(tasks);
  }

  Widget _buildRemovedItem(int task, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: TaskWidget(
        task: TaskModel(taskTitle: 'Task $task'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedList(
        key: _listKey,
        initialItemCount: tasks.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: TaskWidget(
              task: TaskModel(taskTitle: 'Task ${tasks[index]}'),
              onDelete: () => deleteTask(index),
            ),
          );
        },
      ),
      // return Column(
      //   children: List.generate(
      //       tasks.length,
      //       (index) => Dismissible(
      //           key: ValueKey<int>(tasks[index]),
      //           onDismissed: (direction) {
      //             deleteTask(index);
      //           },
      //           child: TaskWidget(
      //             taskDescription: 'Task ${tasks[index]} created',
      //             onDelete: () => deleteTask(index),
      //           ))),
      // );
    );
  }
}

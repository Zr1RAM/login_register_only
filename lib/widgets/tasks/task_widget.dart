import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/views/task_details_screen.dart';

class TaskWidget extends StatefulWidget {
  final TaskModel task;
  final VoidCallback? onDelete;
  final ValueChanged<TaskModel>? onTaskUpdated;

  const TaskWidget({
    super.key,
    required this.task,
    this.onDelete,
    this.onTaskUpdated,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false, isEditing = false;
  late FocusNode _focusNode;
  late TextEditingController _textController;
  late String taskDesc = widget.task.taskTitle;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.isCompleted;
    _focusNode = FocusNode();
    _textController = TextEditingController();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          if (_textController.text != "") {
            taskDesc = _textController.text;
            widget.onTaskUpdated!(
                TaskModel(taskTitle: taskDesc, isCompleted: isChecked));
          }
          isEditing = !isEditing;
        });
      }
      // if (_focusNode.hasFocus) {
      //   print("textfield has focus");
      // } else {
      //   print("textfield lost focus");
      // }
    });
  }

  void toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 75, 75, 75),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Checkbox(
              value: isChecked,
              side: const BorderSide(
                color: Color.fromARGB(255, 192, 192, 192),
                width: 2,
              ),
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color.fromARGB(255, 4, 82, 6);
                }
                return null;
              }),
              onChanged: (bool? val) {
                setState(() {
                  isChecked = val!;
                  widget.onTaskUpdated!(
                      TaskModel(taskTitle: taskDesc, isCompleted: val));
                });
              }),
          !isEditing
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TaskDetailsScreen()));
                  },
                  child: Text(
                    taskDesc,
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              : SizedBox(
                  width: 500,
                  child: TextField(
                      focusNode: _focusNode,
                      controller: _textController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: taskDesc, // Placeholder text
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 117, 117, 116)),
                        // labelText: widget.taskDescription,
                        // labelStyle: const TextStyle(
                        //     color: Color.fromARGB(
                        //         255, 117, 117, 116)), // Label text color
                      ),
                      style: const TextStyle(color: Colors.white)),
                ),
          const Spacer(),
          IconButton(
              onPressed: toggleEdit,
              icon: Icon(
                !isEditing ? Icons.edit : Icons.save,
                color: Colors.white,
              )),
          IconButton(
              onPressed: widget.onDelete ?? () {},
              icon: const Icon(
                Icons.delete,
                color: Color.fromARGB(255, 119, 16, 16),
              ))
          //
        ],
      ),
    );
  }
}

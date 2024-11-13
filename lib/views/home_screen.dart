import 'package:flutter/material.dart';
import 'package:login_register_only/models/task_model.dart';
import 'package:login_register_only/providers/task_provider.dart';
import 'package:login_register_only/views/task_manager_screen.dart';
import 'package:login_register_only/widgets/tasks/animated_tasks_list.dart';
import 'package:login_register_only/widgets/tasks/new_task_bottom_sheet.dart';
import 'package:login_register_only/widgets/tasks/tasks_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: const TaskManagerScreen(),
    );
  }
}

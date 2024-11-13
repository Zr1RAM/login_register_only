class TaskModel {
  final bool isCompleted;
  final String taskTitle;

  TaskModel({
    this.isCompleted = false,
    required this.taskTitle,
  });

  // Convert a TaskModel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'isCompleted': isCompleted,
      'taskTitle': taskTitle,
    };
  }

  // Convert a map to a TaskModel instance
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      isCompleted: json['isCompleted'] ?? false,
      taskTitle: json['taskTitle'],
    );
  }
}

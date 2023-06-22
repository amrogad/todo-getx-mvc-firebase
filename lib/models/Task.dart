class Task {
  static const String collectionName = 'Tasks';
  String id;
  String taskTitle;
  DateTime date;
  String description;
  bool isDone;

  Task({this.id = '', required this.taskTitle, required this.date, required this.description, this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'taskTitle': taskTitle,
      'date': date.toString(),
      'description': description,
      'isDone': isDone,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(id: json['id'], taskTitle: json['taskTitle'], date: DateTime.parse(json['date']), description: json['description'], isDone: json['isDone']);
  }
}

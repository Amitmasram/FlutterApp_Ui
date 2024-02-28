import '../../core/utils/extract_date.dart';

class TaskModel {
  String? id;
  String title;
  String description;
  DateTime date;
  DateTime time;
  bool isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.isDone,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': (ExtractDate.extractDate(date)).millisecondsSinceEpoch,
      'time': time.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromFirestore(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.fromMillisecondsSinceEpoch( json['date']),
      //ExtractDate.extractDate(DateTime.fromMillisecondsSinceEpoch(json['date'])),
      time: DateTime.fromMillisecondsSinceEpoch(json['time']),
      isDone: json['isDone'],
    );
  }
}

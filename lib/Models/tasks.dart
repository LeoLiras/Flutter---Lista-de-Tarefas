class Task{

  String task_txt;
  DateTime date;

  Task({required this.task_txt, required this.date});

  Task.fromJson(Map<String, dynamic> json)
    : task_txt = json['task_txt'],
      date = DateTime.parse(json['date']);

  Map<String, dynamic> toJson(){
    return{
      'task_txt': task_txt,
      'date': date.toIso8601String(),
    };
  }
}

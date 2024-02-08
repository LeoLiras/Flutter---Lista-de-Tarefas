import 'package:flutter/material.dart';

import '../Models/tasks.dart';
import '../widgets/list_item.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController textControler = TextEditingController();

  List<Task> tasks = [];
  Task? deletedTask;
  int? deletedPos;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textControler,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Insira uma tarefa',
                          hintText: 'Ex: Limpar a casa',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            Task newTask = Task(
                              task_txt: textControler.text,
                              date: DateTime.now(),
                            );
                            tasks.add(newTask);
                          });
                          textControler.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.all(13)),
                        child: Icon(
                          Icons.add,
                          size: 25,
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in tasks)
                        ListItem(
                          new_task: task,
                          deleteTask: deleteTask,
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                          'Você possui ${tasks.length} tarefas pendentes.'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: deleteAllConfirmation,
                      child: Text('Limpar tudo'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.all(13)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask(Task task) {
    deletedTask = task;
    deletedPos = tasks.indexOf(task);

    Future.delayed(Duration(microseconds: 500), () {
      setState(() {
        tasks.remove(task);
      });
    });


    /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Tarefa removida com sucesso!'),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              tasks.insert(deletedPos!, deletedTask!);
            });
          }),
    ));*/
  }

  void deleteAllConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content:
            Text('Você tem certeza de que deseja limpar todas as tarefas?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')),
          TextButton(onPressed: () {
            Navigator.of(context).pop();
            deleteAll();
          }, child: Text('Limpar Tudo')),
        ],
      ),
    );
  }

  void deleteAll(){
    setState(() {
      tasks.clear();
    });
  }
}

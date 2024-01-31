import 'package:flutter/material.dart';

import '../widgets/list_item.dart';

class ToDoListPage extends StatefulWidget {
  ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TextEditingController textControler = TextEditingController();

  List<String> tasks = [];

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
                        onPressed: (){
                          setState(() {
                            tasks.add(textControler.text);
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
                SizedBox(height: 20,),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for(String task in tasks)
                        ListItem(
                          task_text: task,
                        )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Text('Você possui ${tasks.length} tarefas pendentes.'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
}

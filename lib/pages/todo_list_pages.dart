import 'package:flutter/material.dart';

class ToDoListPage extends StatelessWidget {
  ToDoListPage({super.key});

  final TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Insira uma tarefa',
                        hintText: 'Ex: Limpar a casa',
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: null,
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
              ListView(
                shrinkWrap: true,
                children: [

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui 0 tarefas pendentes.'),
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
    );
  }
}

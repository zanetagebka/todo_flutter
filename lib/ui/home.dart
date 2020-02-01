import 'package:flutter/material.dart';
import 'package:my_todo_list/ui/to_do_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("ToDo"),
        backgroundColor: Colors.black54,
      ),
      body: new ToDoScreen(),
    );
  }
}
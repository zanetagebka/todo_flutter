import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => new _ToDoScreenState();
}

  class _ToDoScreenState extends State<ToDoScreen> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: Colors.black87,
        body: Column(),

        floatingActionButton: new FloatingActionButton(
          tooltip: "Add Item",
          backgroundColor: Colors.redAccent,
          child: new ListTile(
            title: Icon(Icons.add),
          ),
          onPressed: _showFormDialog),
      );
    }

    void _showFormDialog() {

    }
  }
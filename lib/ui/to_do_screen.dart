import 'package:flutter/material.dart';
import 'package:my_todo_list/model/do_item.dart';
import 'package:my_todo_list/util/database_client.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => new _ToDoScreenState();
}

  class _ToDoScreenState extends State<ToDoScreen> {
    final TextEditingController _textEditingController = new TextEditingController();
    var db = new DatabaseHelper();
    final List<DoItem> _itemList = <DoItem>[];

    @override
    void initState() {
      super.initState();

      _readDoList();
    }

    void _handleSubmit(String text) async {
      _textEditingController.clear();

      DoItem doItem = DoItem(text, DateTime.now().toIso8601String());
      int savedItemId = await db.saveItem(doItem);

      DoItem addedItem = await db.getItem(savedItemId);

      setState(() {
        _itemList.insert(0, addedItem);
      });
    }


    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        backgroundColor: Colors.black87,
        body: new Column(
          children: <Widget>[
            new Flexible(child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: false,
                itemCount: _itemList.length,
                itemBuilder: (_, int index) {
                  return new Card(
                    color: Colors.white10,
                    child: new ListTile(
                      title: _itemList[index],
                      onLongPress: () => debugPrint(""),
                      trailing: new Listener(
                        key: new Key(_itemList[index].itemName),
                        child: new Icon(Icons.remove_circle,
                        color: Colors.redAccent,),
                        onPointerDown: (pointerEvent) => debugPrint(""),
                      ),
                    ),
                  );
            }),
            ),
            new Divider(
              height: 1.0,
            )
          ],
        ),

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
      var alert = new AlertDialog(
        content: new Row(
          children: <Widget>[
            new Expanded(child: new TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: new InputDecoration(
                labelText: "Item",
                hintText: "eg. do shopping",
                icon: new Icon(Icons.note_add)
              ),
            ))
          ],
        ),
        actions: <Widget>[
          new FlatButton(onPressed: () {
            _handleSubmit(_textEditingController.text);
            _textEditingController.clear();
          },
              child: Text("Save")),
          new FlatButton(onPressed: () => Navigator.pop(context),
              child: Text("Cancel"))
        ],
      );
      showDialog(context: context,
      builder: (_) {
        return alert;
      });
    }

    _readDoList() async {
      List items = await db.getItems();
      items.forEach((item) {
        DoItem doItem = DoItem.map(item);
        print("Db items: ${doItem.itemName}");
      });
    }
  }
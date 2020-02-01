import 'package:flutter/material.dart';

class DoItem extends StatelessWidget {
  @override
  String _itemName;
  String _dateCreated;
  int _id;

  DoItem(this._itemName, this._dateCreated);

DoItem.map(dynamic obj) {
  this._itemName = obj["itemName"];
  this._dateCreated = obj["dateCreated"];
  this._itemName = obj["id"];
}

String get itemName => _itemName;
String get dateCreated => _dateCreated;
int get id => _id;

Map<String, dynamic> toMap() {
  var map = new Map<String, dynamic>();
  map["itemName"] = _itemName;
  map["dateCreated"] = _dateCreated;

  if (_id != null) {
    
  }
}

  Widget build(BuildContext context) {
    return
  }
}
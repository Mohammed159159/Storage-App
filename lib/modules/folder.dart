import 'package:flutter/material.dart';

class Folder{
  String name;
  DateTime date;
  int content;
  String icon = "assets/icons/open folder.svg";
  Folder({this.name, this.content, this.date});
}

List<Folder> folders = [
  Folder(name: "Jakarta", date: DateTime(2020, 10, 15), content: 80),
  Folder(name: "Holidays", date: DateTime(2020, 10, 16), content: 30),
  Folder(name: "Family", date: DateTime(2020, 10, 17), content: 25),
  Folder(name: "School", date: DateTime(2020, 10, 18), content: 17),
  Folder(name: "Manalang", date: DateTime(2020, 10, 19), content: 87),
  Folder(name: "Town", date: DateTime(2020, 10, 20), content: 45),


];
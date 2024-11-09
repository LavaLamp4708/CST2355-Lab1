import 'package:floor/floor.dart';

@entity
class ToDoItem {
  static int ID = 1;

  @primaryKey
  final int id;
  final String toDoItem;

  ToDoItem(this.id, this.toDoItem) {
    ID = id > ID ? id + 1 : ID;
  }
}
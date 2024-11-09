import 'package:floor/floor.dart';
import 'package:my_flutter_labs/todo_item.dart';

@dao
abstract class ToDoDAO {
  @Query('SELECT * FROM ToDoItem')
  Future<List<ToDoItem>> findAllItems();

  @insert
  Future<void> insertItem(ToDoItem i);

  @delete
  Future<void> deleteItem(ToDoItem i);
}
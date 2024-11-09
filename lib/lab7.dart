import 'package:flutter/material.dart';
import 'package:my_flutter_labs/database.dart';
import 'package:my_flutter_labs/todo_dao.dart';

import 'todo_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<ToDoItem> _toDoList = [];
  late TextEditingController _toDoListTextController;
  late final ToDoDAO myDAO;

  @override
  void initState() {
    super.initState();
    _toDoListTextController = TextEditingController();
    _initializeDB();
  }

  @override
  void dispose() {
    _toDoListTextController.dispose();
    super.dispose();
  }

  Future<void> _initializeDB() async {
    $FloorAppDatabase
      .databaseBuilder('todo_list_databse.db')
      .build()
      .then((database){
        myDAO = database.toDoDAO;
        myDAO.findAllItems().then((listOfItems){
          setState (() {
            _toDoList.clear();
            _toDoList.addAll(listOfItems);
          });
        });
      });
  }

  Future<void> _addToList() async {
    if (_toDoListTextController.value.text.isNotEmpty) {
      setState(() {
        var newItem = ToDoItem(ToDoItem.ID++, _toDoListTextController.value.text);
        myDAO.insertItem(newItem);
        _toDoList.add(newItem);
        _toDoListTextController.text = "";
      });
    }
  }

  Future<void> _deleteFromList(int itemNumber) async {
    setState(() {
      myDAO.deleteItem(_toDoList[itemNumber]);
      _toDoList.removeAt(itemNumber);
    });
  }

  Widget _ifEmpty(){
    if(_toDoList.isEmpty){
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("The list is empty...", style: TextStyle(fontSize: 20),)]
      );
    }
    return const SizedBox.shrink();
  }

  void _alertConfirmItemDeletion(int itemNumber){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Delete item $itemNumber?"),
        content: Text('"${ _toDoList[itemNumber].toDoItem}"', style: TextStyle(fontSize: 20),),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _deleteFromList(itemNumber);
                  Navigator.of(context).pop();
                },
                child: const Text("Yes", style: TextStyle(fontSize: 36)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: const Text("No", style: TextStyle(fontSize: 36))
              ),
            ],
          )
        ]
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 15,),
                ElevatedButton(onPressed: _addToList, child: const Text("Add", style: TextStyle(fontSize: 28),)),
                const SizedBox(width: 15),
                Expanded(
                  child: TextField(
                    controller: _toDoListTextController,
                    decoration: const InputDecoration(
                      hintText: "Todo list item",
                      border: OutlineInputBorder()
                    ),
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _addToList(),
                  ),
                ),
                const SizedBox(width: 15)
              ],
            )
          ),
          _ifEmpty(),
          Expanded(
            child:
            ListView.builder(
              itemCount: _toDoList.length,
              itemBuilder: (context, rowNum) {
                return GestureDetector(
                  onLongPress: () {
                    _alertConfirmItemDeletion(rowNum);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 15,),
                      Text("Item ${rowNum + 1}:", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 20,),
                      Expanded(child: Text(_toDoList[rowNum].toDoItem, style: const TextStyle(fontSize: 20))),
                      const SizedBox(width: 15)
                    ],
                  ),
                );
                
              }
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          OutlinedButton(onPressed: null, child: Text("button 1")),
          OutlinedButton(onPressed: null, child: Text("button 2"))
        ],
      ),
      drawer: Drawer(child: Text("Hi there :)"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            ElevatedButton(onPressed: null, child: Text("Button",),),
            ElevatedButton(onPressed: null, child: Text("Button",),),
            ElevatedButton(onPressed: null, child: Text("Button",),),
            ElevatedButton(onPressed: null, child: Text("Button",),),
          ],
        ),
      ),
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
      BottomNavigationBarItem(icon: Icon(Icons.add_call), label: 'Phone'),
    ],
        onTap:(btnIndex){}),
    );
  }
}

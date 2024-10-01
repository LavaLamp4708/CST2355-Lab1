import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BROWSE CATEGORIES'),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("BY MEAT"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/beef.jpg'),
                  radius: 60,
                ),

                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/chicken.jpg'),
                  radius: 60,

                ),
                CircleAvatar(backgroundImage: AssetImage('lib/images/pork.jpg'),),
                CircleAvatar(backgroundImage: AssetImage('lib/images/seafood.jpg'),)
            ],),
            Text("BY COURSE"),

          ],
        ),
      ),
    );
  }
}

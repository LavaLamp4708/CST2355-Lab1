import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  late TextEditingController _username;
  late TextEditingController _password;
  var _imagePath = 'lib/images/question-mark.png';

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void attemptLogin(String username, String password) {
    setState(() {
      _imagePath = password == "QWERTY123" ? 'lib/images/idea.png' : 'lib/images/stop.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _username,
              decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
                labelText: "Username",
              ),
            ),
            TextField(controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
                labelText: "Password",
              ),
            ),
            ElevatedButton(onPressed: () {
              attemptLogin(_username.text,_password.text);
            }
            , child: const Text('Login'),
            ),
            Image.asset(
              _imagePath,
              width: 300,
              height: 300,
            )
          ]
        )
      )
    );
  }
}

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool loginIsSet = false;
  var _imagePath = 'lib/images/question-mark.png';

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
    loadLogin();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void attemptLogin(String username, String password) {
    setState(() {
      _imagePath = username == "QWERTY123" ? 'lib/images/idea.png' : 'lib/images/stop.png';
    });
  }

  Future<void> alertSavedLogin() async {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("Automatically filled in your login credentials"),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: Text("Keep", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          setState(() {
            _username.clear();
            _password.clear();
          });
        },
      ),
      duration: const Duration(days: 1),
    );
    Future.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  Future<void> loadLogin() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    String? savedUsername = await prefs.getString('username');
    String? savedPassword = await prefs.getString('password');

    setState(() {
      _username.text = savedUsername ?? '';
      _password.text = savedPassword ?? '';
      loginIsSet = _username.text.isNotEmpty && _password.text.isNotEmpty;
    });

    if (loginIsSet) {
      alertSavedLogin();
    }
  }

  Future<void> saveLogin(String u, String p) async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    await prefs.setString('username', u);
    await prefs.setString('password', p);
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
            ElevatedButton(
              onPressed: () {
                attemptLogin(_username.text,_password.text);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Do you want to save your login information?"),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                saveLogin(_username.text, _password.text);
                                Navigator.of(context).pop();
                              },
                              child: Text("Yes", style: TextStyle(fontSize: 40))),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("No", style: TextStyle(fontSize: 40))),
                        ],
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Login'),
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

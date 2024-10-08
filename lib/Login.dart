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
  bool loginIsSet = true;
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

    if (loginIsSet) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Login information saved!"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              _username.clear();
              _password.clear();
            },
          ),
        ),
      );
    }
  }

  void loadLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username.text = prefs.getString('username') ?? '';
      _password.text = prefs.getString('password') ?? '';
      if(prefs.getString('username') == null && prefs.getString('password') == null) {
        loginIsSet = false;
      }
    });
  }

  void saveLogin(String u, String p) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
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

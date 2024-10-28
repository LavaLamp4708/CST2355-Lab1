import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'DataRepository.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});
  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _phoneNumber;
  late TextEditingController _emailAddress;
  late String _usrName;

  Future<void> _getUsrName() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    String? usrName = await prefs.getString('username') ?? '';

    setState((){
      _usrName = usrName;
    });
  }

  @override
  void initState(){
    super.initState();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _phoneNumber = TextEditingController();
    _emailAddress = TextEditingController();
    DataRepository.loadData();
    _getUsrName();
  }

  @override
  void dispose(){
    DataRepository.saveData();
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _emailAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome back, $_usrName!")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(''),
        ]
      )
    )
  }
}
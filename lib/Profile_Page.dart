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

  static const IconData phone = IconData(0xe4a2, fontFamily: 'MaterialIcons');

  Future<void> _getUsrName() async {
    EncryptedSharedPreferences prefs = EncryptedSharedPreferences();
    String? usrName = await prefs.getString('username') ?? '';

    setState((){
      _usrName = usrName;
    });
  }

  void _call(){

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
          TextField(
            controller: _firstName,
            decoration: InputDecoration(
              hintText: "First Name",
              border: OutlineInputBorder(),
              labelText: "FirstName",
            ),
          ),
          TextField(
            controller: _lastName,
            decoration: InputDecoration(
              hintText: "Last Name",
              border: OutlineInputBorder(),
              labelText: "Last Name",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Flexible(
                child: TextField(
                  controller: _phoneNumber,
                  decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                  ),
                )
              ),
              IconButton(
                  icon: Container(
                    child: IconData()
                  ), 
                  onPressed: _call();
              ),
            ]
          )

        ]
      )
    )
  }
}
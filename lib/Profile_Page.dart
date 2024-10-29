import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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

  void _alertBadUrl(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(message),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Continue", style: TextStyle(fontSize: 40)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]
          )
        ]
      )
    );
  }

  void _call() async{
    final String tel = _phoneNumber.text;
    final Uri phoneUri = Uri(scheme: 'tel', path: tel);

    if (await canLaunchUrl(phoneUri)){
      await launchUrl(phoneUri);
    } else {
      _alertBadUrl("Unable to make phone call.");
    }
  }

  void _text() async {
    final String tel = _phoneNumber.text;
    final Uri phoneUri = Uri(scheme: 'sms', path: tel);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      _alertBadUrl("Unable to send SMS message.");
    }
  }

  void _email() async {
    final String email = _emailAddress.text;
    final Uri emailUri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(emailUri)){
      await launchUrl(emailUri);
    } else {
      _alertBadUrl("Unable to send email.");
    }
  }

  void _onFNameChanged(String str){
    DataRepository.fName = str;
    DataRepository.saveData();
  }

  void _onLNameChanged(String str){
    DataRepository.lName = str;
    DataRepository.saveData();
  }

  void _onPhoneChanged(String str){
    DataRepository.phone = str;
    DataRepository.saveData();
  }

  void _onEmailChanged(String str){
    DataRepository.email = str;
    DataRepository.saveData();
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
            onChanged: _onFNameChanged,
            decoration: const InputDecoration(
              hintText: "First Name",
              border: OutlineInputBorder(),
              labelText: "First Name:",
            ),
          ),
          TextField(
            controller: _lastName,
            onChanged: _onLNameChanged,
            decoration: const InputDecoration(
              hintText: "Last Name",
              border: OutlineInputBorder(),
              labelText: "Last Name:",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Flexible(
                child: TextField(
                  controller: _phoneNumber,
                  onChanged: _onPhoneChanged,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    border: OutlineInputBorder(),
                    labelText: "Phone Number:",
                  ),
                )
              ),
              IconButton(
                  icon: Container(
                    child: Icon(Icons.phone)
                  ), 
                  onPressed: _call
              ),
              IconButton(
                icon: Container(
                  child: Icon(Icons.sms)
                ),
                onPressed: _text,
              )
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Flexible(
                child: TextField(
                  controller: _emailAddress,
                  onChanged: _onEmailChanged,
                  decoration: const InputDecoration(
                    hintText: 'Email Address: (JohnDoe@example.com)',
                    border: OutlineInputBorder(),
                    labelText: "Email Address:"
                  )
                )
              ),
              IconButton(
                icon: Container(
                  child: Icon(Icons.email)
                ),
                onPressed: _email
              )
            ]
          )

        ]
      )
    );
  }
}
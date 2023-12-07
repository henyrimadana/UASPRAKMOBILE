import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tgs_pemrograman_mobile/screens/change_profile.dart';
import 'package:tgs_pemrograman_mobile/widgets/bottom_nav_bar.dart';

class Profile extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences _prefs;
  late String _email = '';
  late String _age = '';
  late String _address = '';
  late String _username = '';
  late String _password = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    // _clearProfileData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProfileData(); // Memuat data setiap kali ada perubahan dependencies (widget ini)
  }

  Future<void> _loadProfileData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = _prefs.getString('email') ?? '';
      _age = _prefs.getString('age') ?? '';
      _address = _prefs.getString('address') ?? '';
      _username = _prefs.getString('username') ?? '';
      _password = _prefs.getString('password') ?? '';
    });
  }

  // Future<void> _clearProfileData() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   await _prefs.remove('email');
  //   await _prefs.remove('age');
  //   await _prefs.remove('address');
  //   // await _prefs.remove('username');
  //   // await _prefs.remove('password');
  // }

  Widget _buildProfileCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: title == 'Password'
            ? Text(
                '*' * value.length, // Replaces password text with asterisks
                style: TextStyle(fontSize: 14),
              )
            : Text(
                value,
                style: TextStyle(fontSize: 14),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profil.jpeg'),
            ),
          ),
          SizedBox(height: 20),
          _buildProfileCard('Username', _username),
          _buildProfileCard('Password', _password),
          _buildProfileCard('Email', _email),
          _buildProfileCard('Age', _age),
          _buildProfileCard('Address', _address),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangeProfile()),
                );
              },
              child: Text('Edit Profile'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }
}

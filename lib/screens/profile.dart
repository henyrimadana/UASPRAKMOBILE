import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tgs_pemrograman_mobile/screens/change_profile.dart';
import 'package:tgs_pemrograman_mobile/screens/login_screen.dart';
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

  Widget _buildProfileCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Flexible(
              child: title == 'Password'
                  ? Text(
                      '*' * value.length,
                      style: TextStyle(fontSize: 16),
                    )
                  : Text(
                      value,
                      style: TextStyle(fontSize: 16),
                    ),
            ),
          ],
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
        padding: EdgeInsets.all(15.0),
        children: [
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/developer.jpeg'),
            ),
          ),
          SizedBox(height: 30),
          _buildProfileCard('Username', _username),
          _buildProfileCard('Password', _password),
          _buildProfileCard('Email', _email),
          _buildProfileCard('Umur', _age),
          _buildProfileCard('Alamat', _address),
          SizedBox(height: 20),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangeProfile()),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Log out'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }
}

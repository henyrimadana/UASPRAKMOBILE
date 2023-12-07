import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tgs_pemrograman_mobile/widgets/bottom_nav_bar.dart';

class ChangeProfile extends StatefulWidget {
  static const routeName = '/change_profile';

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  late TextEditingController _emailController;
  late TextEditingController _ageController;
  late TextEditingController _addressController;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _ageController = TextEditingController();
    _addressController = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = _prefs.getString('email') ?? '';
      _ageController.text = _prefs.getString('age') ?? '';
      _addressController.text = _prefs.getString('address') ?? '';
    });
  }

  Future<void> _saveProfile() async {
    await _prefs.setString('email', _emailController.text);
    await _prefs.setString('age', _ageController.text);
    await _prefs.setString('address', _addressController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profile updated!')),
    );
    // Navigate back to Profile after saving
    Navigator.pop(context);
  }

  Future<void> _deleteProfileData(String field) async {
    switch (field) {
      case 'email':
        await _prefs.remove('email');
        _emailController.clear(); // Clear email controller
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email deleted!')),
        );
        break;
      case 'age':
        await _prefs.remove('age');
        _ageController.clear(); // Clear age controller
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Age deleted!')),
        );
        break;
      case 'address':
        await _prefs.remove('address');
        _addressController.clear(); // Clear address controller
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Address deleted!')),
        );
        break;
      default:
        break;
    }
  }

  IconButton _buildDeleteButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.delete),
    );
  }

  Widget _buildTextFieldWithDeleteButton(TextEditingController controller,
      String labelText, VoidCallback onPressed) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: labelText),
          ),
        ),
        _buildDeleteButton(onPressed),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _ageController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextFieldWithDeleteButton(_emailController, 'Email', () {
              _deleteProfileData('email');
            }),
            SizedBox(height: 20),
            _buildTextFieldWithDeleteButton(_ageController, 'Age', () {
              _deleteProfileData('age');
            }),
            SizedBox(height: 20),
            _buildTextFieldWithDeleteButton(_addressController, 'Address', () {
              _deleteProfileData('address');
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }
}

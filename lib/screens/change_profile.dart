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

  Future<void> _deleteAllProfileData() async {
    await _prefs.remove('email');
    await _prefs.remove('age');
    await _prefs.remove('address');
    _emailController.clear();
    _ageController.clear();
    _addressController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('All profile data deleted!')),
    );
  }

  Future<void> _deleteProfile(String field) async {
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
      icon: Icon(Icons.close),
    );
  }

  Widget _buildTextFieldWithDeleteButton(TextEditingController controller,
      String labelText, VoidCallback onPressed) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors
                        .orange), // Warna garis bawah input teks saat fokus
              ),
            ),
            style: TextStyle(
                color: const Color.fromARGB(
                    255, 255, 255, 255)), // Warna teks input
          ),
        ),
        _buildDeleteButton(onPressed),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextFieldWithDeleteButton(_emailController, 'Email', () {
              _deleteProfile('email');
            }),
            SizedBox(height: 30),
            _buildTextFieldWithDeleteButton(_ageController, 'Age', () {
              _deleteProfile('age');
            }),
            SizedBox(height: 30),
            _buildTextFieldWithDeleteButton(_addressController, 'Address', () {
              _deleteProfile('address');
            }),
            SizedBox(height: 70),
            ElevatedButton.icon(
              onPressed: _saveProfile,
              icon: Icon(Icons.save,
                  size: 30), // Icon baksampah dengan ukuran besar
              label: Text('Save', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Warna latar belakang tombol hapus semua
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _deleteAllProfileData,
              icon: Icon(Icons.delete,
                  size: 30), // Icon baksampah dengan ukuran besar
              label: Text('Delete All', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Warna latar belakang tombol hapus semua
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }
}

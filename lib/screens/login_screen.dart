import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tgs_pemrograman_mobile/screens/home_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/profile.dart';
import 'package:tgs_pemrograman_mobile/services/fetchapi.dart';
import '../widgets/custom_tag.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> users = {
    "heny": "heny123",

    // Tambahkan username dan password tambahan di sini
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),

            Image.asset('assets/images/giganews-login.png'),

            // Image.asset(''),
            Text('SIGN IN',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Text(
              'Username',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                maxLength: 7,
                controller: _usernameController,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16.0),
                primary: Color(0xFF0093A9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                String enteredUsername = _usernameController.text;
                String enteredPassword = _passwordController.text;

                if (users.containsKey(enteredUsername) &&
                    users[enteredUsername] == enteredPassword) {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('username', enteredUsername);
                  await prefs.setString('password', enteredPassword);

                  Navigator.pushReplacementNamed(
                    context,
                    Profile.routeName,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Color.fromARGB(255, 255, 15, 15),
                      content: Text(
                        'Incorrect Username or Password',
                        style: TextStyle(
                            color: Colors
                                .white), // Mengubah warna teks menjadi putih
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

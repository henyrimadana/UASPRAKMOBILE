import 'package:flutter/material.dart';
// import 'package:tgs_pemrograman_mobile/screens/article_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/discover_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/home_screen.dart';
import 'package:tgs_pemrograman_mobile/screens/profile.dart';

// import 'package:tgs_pemrograman_mobile/screens/settings.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(left: 50),
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(Icons.home),
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, DiscoverScreen.routeName);
              },
              icon: const Icon(Icons.search),
            ),
            label: 'Search'),
        BottomNavigationBarItem(
            icon: Container(
              margin: const EdgeInsets.only(right: 50),
              child: IconButton(
                onPressed: () {
                  print('Button Profile clicked');
                  Navigator.pushNamed(context, Profile.routeName);
                },
                icon: const Icon(Icons.person),
              ),
            ),
            label: 'Profile')
      ],
    );
  }
}

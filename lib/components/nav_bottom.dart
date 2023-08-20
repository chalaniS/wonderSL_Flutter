import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class bottomNavigationBar extends StatelessWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.home_outline),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.location_outline),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.bookmark_outline),
          label: "Bookmark",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.chatbubble_ellipses_outline), // Correct icon name
          label: "Messenger",
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.person_outline),
          label: "Profile",
        ),
      ],
    );
  }
}

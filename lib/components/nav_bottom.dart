import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wondersl/pages/my_tours.dart';

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
      onTap: (int index) {
        // Handle item clicks based on their index
        if (index == 2) {
          // If the "Bookmark" icon is clicked (index 2), navigate to the MyTours page
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  MyTours(), // Replace with the actual MyTours widget
            ),
          );
        }
      },
    );
  }
}

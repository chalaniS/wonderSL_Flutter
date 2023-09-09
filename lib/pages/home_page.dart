import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wondersl/pages/map_page.dart';
import 'package:wondersl/pages/profile_page.dart';

import '../components/nav_bottom.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/location_card.dart';
import '../widgets/nearby_places.dart';
import '../widgets/recommended_places.dart';
import '../widgets/tourist_places.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wrap your app in MaterialApp for navigation
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Good Morning"),
              Text(
                "Tetteh Jeron Asiedu",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
          actions: const [
            CustomIconButton(
              icon: Icon(Ionicons.search_outline),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 12),
              child: CustomIconButton(
                icon: Icon(Ionicons.notifications_outline),
              ),
            ),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          children: [
            // LOCATION CARD
            const LocationCard(),
            const SizedBox(
              height: 15,
            ),
            const TouristPlaces(),
            // CATEGORIES
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommendation",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(onPressed: () {}, child: const Text("View All"))
              ],
            ),
            const SizedBox(height: 10),
            const RecommendedPlaces(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nearby From You",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(onPressed: () {}, child: const Text("View All"))
              ],
            ),
            const SizedBox(height: 10),
            const NearbyPlaces(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Ionicons.chatbubble_ellipses_outline),
              label: "Messenger",
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              label: "Profile",
            ),
          ],
          onTap: (int index) {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TravelMap(),
                ),
              );
            } else if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserProfile(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

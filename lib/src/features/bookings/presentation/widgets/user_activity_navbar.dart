import 'package:empriusapp/src/features/bookings/presentation/screens/current_bookings_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/screens/keepings_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/screens/rating_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/screens/requests_screen.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserActivityNavbar extends StatefulWidget {

  @override
  createState() => _UserActivityNavbarState();
}

class _UserActivityNavbarState extends State<UserActivityNavbar> {
  int currentIndex = 0;
  final screens = [
    RequestsScreen(),
    CurrentBookingsScreen(),
    RatingScreen(),
    KeepingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppbar("Activitat"),
      body: IndexedStack(
        children: screens,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(()=> currentIndex = index),

        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.front_hand_rounded), label: "Peticions"),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspaces_sharp), label: "En curs"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Valoracions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Custodies",
          ),
        ],
      ),
    );
  }
}

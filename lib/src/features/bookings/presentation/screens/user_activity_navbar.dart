import 'package:empriusapp/src/features/bookings/application/providers/bookings_providers.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/keepings_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/petitions_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/rating_screen.dart';
import 'package:empriusapp/src/features/bookings/presentation/fragments/requests_screen.dart';
import 'package:empriusapp/src/features/user/auth_user/data/user_provider.dart';
import 'package:empriusapp/src/features/user/emprius_user/presentation/widgets/user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserActivityNavbar extends ConsumerStatefulWidget {

  @override
  createState() => _UserActivityNavbarState();
}

class _UserActivityNavbarState extends ConsumerState<UserActivityNavbar> {
  int currentIndex = 0;
  final screens = [
    RequestsScreen(),
    PetitionsScreen(),
    RatingScreen(),
    KeepingsScreen()
  ];

  @override
  void initState() {
    ref.read(allBookingsProvider.notifier)
        .getAllUserPetitions(fromUserId: ref.read(userProvider).id);
    ref.read(allBookingsProvider.notifier)
    .getAllUserRequests(toUserId: ref.read(userProvider).id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: Icon(Icons.front_hand_rounded), label: "Demanades"),
          BottomNavigationBarItem(
              icon: Icon(Icons.workspaces_sharp), label: "Prestades"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Valoracions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: "Custodiades",
          ),
        ],
      ),
    );
  }
}

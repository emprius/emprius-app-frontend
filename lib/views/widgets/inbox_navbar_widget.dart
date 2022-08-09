import 'package:flutter/material.dart';
typedef VoidCallbackParam = Function(int index);

class InboxNavbarWidget extends StatelessWidget {
  VoidCallbackParam voidCallbackParam;
  int currentIndex;
  InboxNavbarWidget(this.voidCallbackParam ,this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: voidCallbackParam,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey.shade600,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      //type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.front_hand_rounded), label: "Peticions"),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard), label: "Devolucions"),
        BottomNavigationBarItem(
          icon: Icon(Icons.handyman_outlined),
          label: "Custodies",
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/activity_screen.dart';
import '../screens/bike_buying.dart';
import '../screens/account_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.offAll(() => const HomeScreen());
            break;
          case 1:
            Get.offAll(() => const ActivityScreen());
            break;
          case 2:
            Get.offAll(() => const ZeroDownPaymentTwoWheeler());
            break;
          case 3:
            Get.offAll(() => const AccountScreen());
            break;
        }
      },
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bike_scooter),
          label: 'Purchase',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }
}

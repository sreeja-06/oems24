import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeja_oems24/screens/home_screen.dart';
import '../../widget/app_bar.dart';
import '../../widget/bottom_nav_bar.dart';
import '../booking_screens/booking_options.dart';

class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Share and Save'),
          Expanded(
            child: Container(
              height: 200,
              child: const RideRequestWidget(),
            ),
          ),
          const Expanded(
            child: ShareAndSaveOptionWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAllNamed('/home');
              break;
            case 1:
              Get.offAllNamed('/activity');
              break;
            case 2:
              Get.offAllNamed('/purchase');
              break;
            case 3:
              Get.offAllNamed('/account');
              break;
          }
        },
      ),
    );
  }

  Widget _buildSubheadingBar(BuildContext context, String title) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.back(),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ShareAndSaveOptionWidget extends StatelessWidget {
  const ShareAndSaveOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RideOptionCard(
      rideOption: RideOption(
        name: "Share and Save",
        timeInfo: "6 min away",
        description: "Share your ride and save money",
        price: "₹30.00",
      ),
      icon: Icons.people,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sreeja_oems24/screens/home_screen.dart';
import '../../widget/app_bar.dart';
import '../booking_screens/booking_options.dart';
import '../../widget/bottom_nav_bar.dart';

class AffordablePage extends StatelessWidget {
  const AffordablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: const CustomAppBar(title: 'OEMS24'), 
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Affordable Cars'),
          Expanded(
            child: Container(
              height: 200, // Adjusted height for the Request a Ride widget
              child: const RideRequestWidget(),
            ),
          ),
          const Expanded(
            child: AffordableCarsOptionWidget(),
          ),
          
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation or actions based on the tapped index
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
            onPressed: () {
              Navigator.pop(context);
            },
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
import 'package:flutter/material.dart';
import '../../widget/app_bar.dart';
import '../../widget/bottom_nav_bar.dart';
import '../booking_screens/booking_options.dart';
import '../home_screen.dart' as home_screen;
import 'package:sreeja_oems24/screens/home_screen.dart';


class BikePage extends StatelessWidget {
  const BikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: const CustomAppBar(title: 'OEMS24'), 
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Bike'),
          Expanded(
            child: Container(
              height: 200, // Adjusted height for the Request a Ride widget
              child: const RideRequestWidget(),
            ),
          ),
          const Expanded(
            child: BikeOptionWidget(),
          ),
        ],
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

class BikeOptionWidget extends StatelessWidget {
  const BikeOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: RideOptionCard(
          rideOption: RideOption(
            name: "Bike",
            timeInfo: "2 min away",
            description: "Quick and affordable bike rides",
            price: "₹20.00",
          ),
          icon: Icons.pedal_bike,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          // Handle navigation or actions based on the tapped index
        },
      ),
    );
  }
}
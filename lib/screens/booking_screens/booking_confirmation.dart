import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/app_bar.dart';
import '../../widget/bottom_nav_bar.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String rideName;
  final String paymentOption;

  const BookingConfirmationScreen({
    super.key,
    required this.rideName,
    required this.paymentOption,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Booking Confirmation'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Your ride has been booked successfully!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  'Ride Option: $rideName',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Payment Option: $paymentOption',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Estimated Arrival: 5 minutes',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Driver Details: John Doe, +91 9876543210',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.offAllNamed('/home'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Go to Home'),
                ),
              ],
            ),
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

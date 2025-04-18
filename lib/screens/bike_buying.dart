import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_nav_bar.dart';
import 'services_screens/bike_buying/ev.dart';
import 'services_screens/bike_buying/petrol.dart';

class ZeroDownPaymentTwoWheeler extends StatelessWidget {
  const ZeroDownPaymentTwoWheeler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Your Segment',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSegmentWidget(
              context,
              title: 'Electric Vehicles (EV)',
              tagline: 'Eco-friendly and cost-effective',
              icon: Icons.electric_bike,
              color: Colors.green,
              onTap: () => Get.to(() => const EVBike()),
            ),
            const SizedBox(height: 16),
            _buildSegmentWidget(
              context,
              title: 'Petrol Vehicles',
              tagline: 'Powerful and reliable',
              icon: Icons.motorcycle,
              color: Colors.purple,
              onTap: () => Get.to(() => const PetrolBike()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // Set the current index for Services
        onTap: (index) {
          if (index != 2) {
            switch (index) {
              case 0:
                Get.offAllNamed('/home');
                break;
              case 1:
                Get.offAllNamed('/activity');
                break;
              case 3:
                Get.offAllNamed('/account');
                break;
            }
          }
        },
      ),
    );
  }

  Widget _buildSegmentWidget(
    BuildContext context, {
    required String title,
    required String tagline,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tagline,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

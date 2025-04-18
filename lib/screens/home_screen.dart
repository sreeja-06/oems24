import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeja_oems24/screens/choose_ride/auto.dart';
import 'package:sreeja_oems24/screens/choose_ride/bike.dart';
import 'package:sreeja_oems24/screens/choose_ride/family.dart';
import 'package:sreeja_oems24/screens/choose_ride/luxury.dart';
import 'package:sreeja_oems24/screens/choose_ride/share.dart';
import 'package:sreeja_oems24/screens/home_screens/schedule_ride.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_nav_bar.dart';
import 'activity_screen.dart';
import 'account_screen.dart';
import 'bike_buying.dart';
import 'booking_screens/booking_options.dart';
import 'services_screens/instant_ambulance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ActivityScreen(),
    const ZeroDownPaymentTwoWheeler(),
    const AccountScreen(),
  ];

  void _onNavBarTap(int index) {
    if (index != _selectedIndex) {
      Get.offAll(() => _screens[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: const HomeScreenContent(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RideRequestWidget(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Get.to(() => const BookingOptions()),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('See Prices'),
          ),
          const SizedBox(height: 24),
          const Text(
            'Our Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildServiceWidget(
                  context,
                  title: 'Instant Ambulance',
                  tagline: 'Emergency medical transport',
                  imagePath: 'assets/icons/ambulance.png',
                  color: Colors.red,
                  onTap: () => Get.to(() => const InstantAmbulanceService()),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildServiceWidget(
                  context,
                  title: 'Schedule Ride',
                  tagline: 'Plan your trip in advance',
                  imagePath: 'assets/icons/yellowcab.png',
                  color: Colors.orange,
                  onTap: () => Get.to(() => const ScheduleRideScreen()),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Purchase a Bike',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildServiceWidget(
            context,
            title: 'Zero Down Payment',
            tagline: 'Buy your dream bike today',
            imagePath: 'assets/icons/bike.png',
            color: Colors.purple,
            onTap: () => Get.to(() => const ZeroDownPaymentTwoWheeler()),
          ),
          const SizedBox(height: 24),
          const Text(
            'Choose Your Own Ride',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildConvenienceWidget(
                  context,
                  title: 'Go with Bike',
                  tagline: 'Fast bike rides for quick trips',
                  icon: Icons.pedal_bike,
                  color: Colors.green,
                  onTap: () => Get.to(() => const BikePage()),
                ),
                const SizedBox(width: 16),
                _buildConvenienceWidget(
                  context,
                  title: 'Go with Auto',
                  tagline: 'Affordable auto rides',
                  icon: Icons.electric_rickshaw,
                  color: Colors.blue,
                  onTap: () => Get.to(() => const AutoPage()),
                ),
                const SizedBox(width: 16),
                _buildConvenienceWidget(
                  context,
                  title: 'Travel with Family',
                  tagline: 'Big SUVs for your family trips',
                  icon: Icons.directions_car,
                  color: Colors.purple,
                  onTap: () => Get.to(() => const FamilyPage()),
                ),
                const SizedBox(width: 16),
                _buildConvenienceWidget(
                  context,
                  title: 'Share and Save',
                  tagline: 'Share your ride and save',
                  icon: Icons.people,
                  color: Colors.teal,
                  onTap: () => Get.to(() => const SharePage()),
                ),
                const SizedBox(width: 16),
                _buildConvenienceWidget(
                  context,
                  title: 'Premium Experience',
                  tagline: 'Luxury cars for special occasions',
                  icon: Icons.star,
                  color: Colors.amber,
                  onTap: () => Get.to(() => const LuxuryPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceWidget(
    BuildContext context, {
    required String title,
    required String tagline,
    IconData? icon,
    String? imagePath,
    String? networkImageUrl,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 248, 207, 255),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (networkImageUrl != null)
              Image.network(
                networkImageUrl,
                width: 280,
                height: 200,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 280,
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / 
                              loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    width: 280,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_taxi,
                          size: 64,
                          color: color,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Schedule Ride',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            else if (imagePath != null)
              Image.asset(
                imagePath,
                width: 280,
                height: 200,
                fit: BoxFit.contain,
              )
            else if (icon != null)
              Icon(
                icon,
                size: 48,
                color: color,
              ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              tagline,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConvenienceWidget(
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
        width: 140,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 12),
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
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RideRequestWidget extends StatefulWidget {
  const RideRequestWidget({super.key});

  @override
  State<RideRequestWidget> createState() => _RideRequestWidgetState();
}

class _RideRequestWidgetState extends State<RideRequestWidget> {
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Request a Ride',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _pickupController,
                decoration: InputDecoration(
                  hintText: 'Enter pickup location',
                  prefixIcon: const Icon(Icons.location_on, color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _dropController,
                decoration: InputDecoration(
                  hintText: 'Enter drop location',
                  prefixIcon: const Icon(Icons.location_pin, color: Colors.deepPurple),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

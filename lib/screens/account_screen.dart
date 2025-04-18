import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_nav_bar.dart';
import 'home_screen.dart';
import 'activity_screen.dart';
import 'account_screens/help_page.dart';
import 'account_screens/profile_page.dart';
import 'account_screens/settings_page.dart';
import 'bike_buying.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 3;

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
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.purple.shade50,
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: const AssetImage('assets/images/profile_placeholder.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Premium Member',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.purple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoCard(
                    'Contact Information',
                    [
                      _buildInfoRow(Icons.email, 'Email', 'johndoe@example.com'),
                      _buildInfoRow(Icons.phone, 'Phone', '+91 9876543210'),
                      _buildInfoRow(Icons.location_on, 'Address', '123 Main Street, City, State - 123456'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    'Insurance Details',
                    [
                      _buildInfoRow(Icons.policy, 'Policy Number', 'INS-1234-5678-90'),
                      _buildInfoRow(Icons.calendar_today, 'Valid Until', '31 Dec 2024'),
                      _buildInfoRow(Icons.car_crash, 'Coverage', 'Comprehensive'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          Icons.person,
                          'Profile',
                          Colors.purple.shade100,
                          () => Get.to(() => const ProfilePage()),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionButton(
                          Icons.settings,
                          'Settings',
                          Colors.blue.shade100,
                          () => Get.to(() => const SettingsPage()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          Icons.help,
                          'Help',
                          Colors.orange.shade100,
                          () => Get.to(() => const HelpPage()),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionButton(
                          Icons.logout,
                          'Logout',
                          Colors.red.shade100,
                          () => Get.offAllNamed('/login'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.purple.shade300),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color, VoidCallback onTap) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Icon(icon, color: Colors.black87),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

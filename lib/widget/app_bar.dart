import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/activity_screen.dart';
import '../screens/account_screens/help_page.dart';
import '../screens/account_screens/profile_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions; // Add optional actions parameter

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu), // Hamburger icon
          onPressed: () {
            if (Scaffold.of(context).hasDrawer) {
              Scaffold.of(context).openDrawer(); // Open the drawer
            } else {
              debugPrint('No drawer found in the current Scaffold.');
            }
          },
        ),
      ),
      actions: actions, // Pass the actions parameter to AppBar
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class LeftMenuDrawer extends StatelessWidget {
  const LeftMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.shade800,
              Colors.purple.shade500,
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'profile_picture',
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://tse4.mm.bing.net/th?id=OIP.Ky2SWuFG0NUC-nWqimNZ5gHaLE&pid=Api&P=0&h=180',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person, color: Colors.white, size: 40),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sreeja Chakraborty',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: () {
                      Get.back();
                      Get.to(
                        () => const ProfilePage(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'View Profile',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      _buildAnimatedMenuItem(
                        context,
                        Icons.card_travel,
                        'My Trips',
                        onTap: () {
                          Get.back();
                          Get.to(() => const ActivityScreen(),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      _buildAnimatedMenuItem(
                        context,
                        Icons.account_balance_wallet,
                        'Wallet',
                      ),
                      _buildAnimatedMenuItem(
                        context,
                        Icons.emergency,
                        'Emergency Contacts',
                      ),
                      _buildAnimatedMenuItem(
                        context,
                        Icons.location_on,
                        'Manage Addresses',
                      ),
                      _buildAnimatedMenuItem(context, Icons.person_add, 'Invite'),
                      _buildAnimatedMenuItem(
                        context,
                        Icons.help_center,
                        'Help Center',
                        onTap: () {
                          Get.back();
                          Get.to(() => const HelpPage(),
                              transition: Transition.rightToLeft);
                        },
                      ),
                      const Divider(height: 0.5),
                      _buildAnimatedMenuItem(
                        context,
                        Icons.exit_to_app,
                        'Logout',
                        color: Colors.red,
                        onTap: () => Get.offAllNamed('/login'),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedMenuItem(
    BuildContext context,
    IconData icon,
    String title, {
    Color? color,
    VoidCallback? onTap,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(30 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap ?? () => Get.back(),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: (color ?? Colors.purple.shade700).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          icon,
                          size: 18,
                          color: color ?? Colors.purple.shade700,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        title,
                        style: TextStyle(
                          color: color ?? Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

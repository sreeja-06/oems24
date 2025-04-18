import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  void initState() {
    super.initState();
    _showPermissionDialog();
  }

  void _showPermissionDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Allow Location Access'),
            content: const Text(
              'OEMS24 collects location data to enable route tracking and navigation, '
              'even when the app is closed or not in use.',
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text(
                  'Deny',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                  Get.offAll(() => const HomeScreen());
                },
                child: const Text(
                  'Proceed',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

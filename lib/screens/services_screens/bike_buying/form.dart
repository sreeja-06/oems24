import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/bottom_nav_bar.dart';

class BikeEnquiryForm extends StatelessWidget {
  const BikeEnquiryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Bike Enquiry'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter your details and our team will contact you shortly.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 24),
                  _buildTextField('Enter your name'),
                  const SizedBox(height: 16),
                  _buildTextField('Enter your contact number'),
                  const SizedBox(height: 16),
                  _buildTextField('Preferred bike model'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Handle bike purchase inquiry action
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text(
                      'Submit Inquiry',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
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

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }
}

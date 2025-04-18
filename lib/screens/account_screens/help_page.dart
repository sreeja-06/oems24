import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/app_bar.dart';
import '../../widget/bottom_nav_bar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Help Center'),
          Expanded(
            child: _buildFAQList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
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

  Widget _buildFAQList() {
    final List<Map<String, String>> faqs = [
      {'question': 'How can I book a ride?', 'answer': 'You can book a ride using the "Request Ride" option on the home screen.'},
      {'question': 'How do I schedule a ride?', 'answer': 'You can schedule a ride using the "Schedule Ride" option under cab services.'},
      // ...existing FAQs...
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: ExpansionTile(
            title: Text(
              faqs[index]['question']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqs[index]['answer']!),
              ),
            ],
          ),
        );
      },
    );
  }
}

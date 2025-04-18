import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app_bar.dart';
import '../../../widget/bottom_nav_bar.dart';

class EVBike extends StatelessWidget {
  const EVBike({super.key});

  final List<Map<String, String>> _bikes = const [
    {'name': 'Ather 450X', 'price': '₹1,35,000', 'range': '116 km'},
    {'name': 'Ola S1 Pro', 'price': '₹1,30,000', 'range': '181 km'},
    {'name': 'TVS iQube', 'price': '₹1,05,000', 'range': '145 km'},
    {'name': 'Hero Electric Photon', 'price': '₹85,000', 'range': '108 km'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'), 
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Electric Vehicles'),
          _buildSortAndFilterBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _bikes.length,
              itemBuilder: (context, index) {
                final bike = _bikes[index];
                return _buildBikeCard(bike['name']!, bike['price']!, bike['range']!);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Get.offAllNamed('/home');
          } else if (index == 1) {
            Get.offAllNamed('/activity');
          } else if (index == 3) {
            Get.offAllNamed('/account');
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

  Widget _buildSortAndFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            label: const Text('Sort'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            label: const Text('Filter'),
          ),
        ],
      ),
    );
  }

  Widget _buildBikeCard(String name, String price, String range) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Price: $price'),
            Text('Range: $range'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: const Size(double.infinity, 36),
              ),
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}

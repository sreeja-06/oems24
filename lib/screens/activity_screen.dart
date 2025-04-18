import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_nav_bar.dart';
import 'activity_screens/see_details.dart';
import 'home_screen.dart';
import 'bike_buying.dart';
import 'account_screen.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  int _selectedIndex = 1;
  String _filterBy = 'All';
  String _sortBy = 'Date';

  final List<Map<String, String>> _activities = [
    {
      'title': 'Trip to KPC Medical',
      'date': 'Apr 3 - 11:25 AM',
      'amount': '₹54.12',
      'status': 'Completed'
    },
    {'status': 'Past', 'title': 'College More', 'date': 'Apr 3 - 11:25 AM', 'amount': '₹0.00'},
    {'status': 'Sant', 'title': 'KPC Medical College & Hospital', 'date': 'Mar 26 - 3:56 PM', 'amount': '₹0.00'},
    {'status': 'Owl', 'title': '', 'date': 'Mar 22 - 10:45 AM', 'amount': '₹54.12'},
    {'status': '', 'title': 'Sonarpur Chakbaria Road', 'date': 'Jul 18 - 1:22 PM', 'amount': '₹0.00 - Canceled'},
  ];

  List<Map<String, String>> get _filteredActivities {
    if (_filterBy == 'All') {
      return _activities;
    }
    return _activities.where((activity) => activity['status'] == _filterBy).toList();
  }

  List<Map<String, String>> get _sortedActivities {
    final sortedActivities = List<Map<String, String>>.from(_filteredActivities);
    switch (_sortBy) {
      case 'Date':
        sortedActivities.sort((a, b) => b['date']!.compareTo(a['date']!));
        break;
      case 'Amount':
        sortedActivities.sort((a, b) {
          double priceA = double.tryParse(a['amount']!.replaceAll('₹', '').replaceAll(',', '')) ?? 0.0;
          double priceB = double.tryParse(b['amount']!.replaceAll('₹', '').replaceAll(',', '')) ?? 0.0;
          return priceB.compareTo(priceA);
        });
        break;
      case 'Distance':
        // Add logic for distance sorting (if distance data is available)
        break;
    }
    return sortedActivities;
  }

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
      body: Column(
        children: [
          _buildFilterBar(),
          _buildSortBar(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _sortedActivities.length,
              itemBuilder: (context, index) {
                final activity = _sortedActivities[index];
                return _buildActivityItem(
                  status: activity['status']!,
                  title: activity['title']!,
                  date: activity['date']!,
                  amount: activity['amount']!,
                  showDetails: true,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTap,
      ),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Filter by:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: _filterBy,
            items: ['All', 'Past', 'Sant', 'Owl']
                .map((filterOption) => DropdownMenuItem(
                      value: filterOption,
                      child: Text(filterOption),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _filterBy = value!;
              });
            },
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }

  Widget _buildSortBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Sort by:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: _sortBy,
            items: ['Date', 'Amount', 'Distance']
                .map((sortOption) => DropdownMenuItem(
                      value: sortOption,
                      child: Text(sortOption),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _sortBy = value!;
              });
            },
            underline: Container(),
            icon: const Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem({
    required String status,
    required String title,
    required String date,
    required String amount,
    required bool showDetails,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount),
        onTap: () => Get.to(() => const SeeDetailsScreen()),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/app_bar.dart';
import '../../widget/bottom_nav_bar.dart';
import 'booking_confirmation.dart';

class RideOption {
  final String name;
  final String timeInfo;
  final String description;
  final String price;

  const RideOption({
    required this.name,
    required this.timeInfo,
    required this.description,
    required this.price,
  });
}

class BookingOptions extends StatelessWidget {
  const BookingOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> rideOptionWidgets = [
      const BikeOptionWidget(),
      const AffordableCarsOptionWidget(),
      const PremierSedansOptionWidget(),
      const ShareAndSaveOptionWidget(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'OEMS24'),
      drawer: const LeftMenuDrawer(),
      body: Column(
        children: [
          _buildSubheadingBar(context, 'Booking Options'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: rideOptionWidgets.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: rideOptionWidgets[index],
                );
              },
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
}

class RideOptionCard extends StatelessWidget {
  final RideOption rideOption;
  final IconData icon;

  const RideOptionCard({super.key, required this.rideOption, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showPaymentDialog(context, rideOption.name),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.purple),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          rideOption.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          rideOption.price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rideOption.timeInfo,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rideOption.description,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context, String rideName) {
    Get.dialog(
      AlertDialog(
        title: const Text('Choose Payment Method'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Cash'),
              onTap: () {
                Get.back();
                Get.to(() => BookingConfirmationScreen(
                      rideName: rideName,
                      paymentOption: 'Cash',
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.credit_card),
              title: const Text('Card'),
              onTap: () {
                Get.back();
                Get.to(() => BookingConfirmationScreen(
                      rideName: rideName,
                      paymentOption: 'Card',
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Digital Wallet'),
              onTap: () {
                Get.back();
                Get.to(() => BookingConfirmationScreen(
                      rideName: rideName,
                      paymentOption: 'Digital Wallet',
                    ));
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

class BikeOptionWidget extends StatelessWidget {
  const BikeOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RideOptionCard(
      rideOption: const RideOption(
        name: "Bike",
        timeInfo: "2 min away",
        description: "Quick and affordable bike rides",
        price: "₹20.00",
      ),
      icon: Icons.pedal_bike,
    );
  }
}

class AffordableCarsOptionWidget extends StatelessWidget {
  const AffordableCarsOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RideOptionCard(
      rideOption: const RideOption(
        name: "Affordable Cars",
        timeInfo: "5 min away",
        description: "Compact and budget-friendly rides",
        price: "₹50.00",
      ),
      icon: Icons.directions_car,
    );
  }
}

class PremierSedansOptionWidget extends StatelessWidget {
  const PremierSedansOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RideOptionCard(
      rideOption: const RideOption(
        name: "Premier Sedans",
        timeInfo: "3 min away",
        description: "Comfortable sedans with top-quality drivers",
        price: "₹120.00",
      ),
      icon: Icons.car_rental,
    );
  }
}

class ShareAndSaveOptionWidget extends StatelessWidget {
  const ShareAndSaveOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RideOptionCard(
      rideOption: const RideOption(
        name: "Share and Save",
        timeInfo: "6 min away",
        description: "Share your ride and save money",
        price: "₹30.00",
      ),
      icon: Icons.people,
    );
  }
}
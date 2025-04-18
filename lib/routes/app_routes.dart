import 'package:get/get.dart';
import '../auth/login_screen.dart';
import '../auth/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/permission_screen.dart';
import '../screens/account_screen.dart';
import '../screens/activity_screen.dart';
import '../screens/bike_buying.dart';
import '../screens/choose_ride/auto.dart';
import '../screens/choose_ride/bike.dart';
import '../screens/choose_ride/family.dart';
import '../screens/choose_ride/luxury.dart';
import '../screens/choose_ride/share.dart';
import '../screens/services_screens/instant_ambulance.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/permission',
      page: () => const PermissionScreen(),
    ),
    GetPage(
      name: '/account',
      page: () => const AccountScreen(),
    ),
    GetPage(
      name: '/activity',
      page: () => const ActivityScreen(),
    ),
    GetPage(
      name: '/purchase',
      page: () => const ZeroDownPaymentTwoWheeler(),
    ),
    GetPage(
      name: '/auto',
      page: () => const AutoPage(),
    ),
    GetPage(
      name: '/bike',
      page: () => const BikePage(),
    ),
    GetPage(
      name: '/family',
      page: () => const FamilyPage(),
    ),
    GetPage(
      name: '/luxury',
      page: () => const LuxuryPage(),
    ),
    GetPage(
      name: '/share',
      page: () => const SharePage(),
    ),
    GetPage(
      name: '/ambulance',
      page: () => const InstantAmbulanceService(),
    ),
  ];
}
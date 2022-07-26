import 'package:dateen/common/bottom_nav_bar.dart';
import 'package:dateen/features/auth/screens/main_%20sign_up.dart';
import 'package:dateen/features/auth/screens/phone_sign_up.dart';
import 'package:dateen/features/auth/screens/phone_verification.dart';
import 'package:dateen/features/details/screens/enable_notification.dart';
import 'package:dateen/features/details/screens/gender_selection.dart';
import 'package:dateen/features/details/screens/interests.dart';
import 'package:dateen/features/details/screens/profile_details.dart';
import 'package:dateen/features/details/screens/search_contact_list.dart';
import 'package:dateen/features/home/screens/home_screen.dart';
import 'package:dateen/features/stories/screens/stories_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen(),
      );
    case PhoneSignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PhoneSignUpScreen(),
      );
    case PhoneVerificationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const PhoneVerificationScreen(),
      );
    case ProfileDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileDetailsScreen(),
      );
    case GenderSelectionScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const GenderSelectionScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case InterestsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const InterestsScreen(),
      );
    case SearchContactListScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SearchContactListScreen(),
      );
    case EnableNotifScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EnableNotifScreen(),
      );
    case BottomNavBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomNavBar(),
      );
      case StoriesScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const StoriesScreen(),
      );
    // case AddProductScreen.routeName:
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => const AddProductScreen(),
    //   );
    // case CategoryDealsScreen.routeName:
    //   var category = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => CategoryDealsScreen(
    //       category: category,
    //     ),
    //   );
    // case SearchScreen.routeName:
    //   var searchQuery = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => SearchScreen(
    //       searchQuery: searchQuery,
    //     ),
    //   );
    // case ProductDetailsScreen.routeName:
    //   var product = routeSettings.arguments as Product;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => ProductDetailsScreen(
    //       product: product,
    //     ),
    //   );
    // case AddressScreen.routeName:
    //   var totalAmount = routeSettings.arguments as String;
    //   return MaterialPageRoute(
    //     settings: routeSettings,
    //     builder: (_) => AddressScreen(
    //       totalAmount: totalAmount,
    //     ),
    //   );
    // case OrderDetailsScreen.routeName:
    //   var order = routeSettings.arguments as Order;
    //   return MaterialPageRoute(
    //     builder: (_) => OrderDetailsScreen(
    //       order: order,
    //     ),
    //   );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}

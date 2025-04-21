import 'package:flutter/material.dart';

/// Class for defining application routes and navigation
class AppRoutes {
  // Route names
  static const String home = '/';
  static const String orders = '/orders';
  static const String orderDetails = '/order-details';
  static const String createOrder = '/create-order';
  static const String settings = '/settings';
  static const String profile = '/profile';

  /// Route definitions with associated builders
  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const DummyScreen(
          color: Colors.blue,
          text: 'Home Screen',
        ),
    orders: (_) => const DummyScreen(
          color: Colors.green,
          text: 'Orders Screen',
        ),
    createOrder: (_) => const DummyScreen(
          color: Colors.orange,
          text: 'Create Order Screen',
        ),
    settings: (_) => const DummyScreen(
          color: Colors.grey,
          text: 'Settings Screen',
        ),
    profile: (_) => const DummyScreen(
          color: Colors.red,
          text: 'Profile Screen',
        ),
  };

  /// Generate route based on settings
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Handle named routes that require parameters
    if (settings.name == orderDetails) {
      final args = settings.arguments as Map<String, dynamic>;
      final String orderId = args['orderId'] as String;

      return MaterialPageRoute(
        settings: settings,
        builder: (_) => DummyScreen(
          color: Colors.purple,
          text: 'Order Details: $orderId',
        ),
      );
    }

    // Check if the route is in our predefined routes
    if (routes.containsKey(settings.name)) {
      return MaterialPageRoute(
        settings: settings,
        builder: routes[settings.name]!,
      );
    }

    // If route is not found, return a 404 page
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Page Not Found')),
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }

  /// Navigate to order details
  static void navigateToOrderDetails(BuildContext context, String orderId) {
    Navigator.pushNamed(
      context,
      orderDetails,
      arguments: {'orderId': orderId},
    );
  }

  /// Navigate to create order screen
  static void navigateToCreateOrder(BuildContext context) {
    Navigator.pushNamed(context, createOrder);
  }
}

/// Temporary dummy screen for placeholder routes
class DummyScreen extends StatelessWidget {
  final Color color;
  final String text;

  const DummyScreen({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(text)),
      body: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

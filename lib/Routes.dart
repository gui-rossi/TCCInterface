import 'package:flutter/material.dart';

import 'LoginPage.dart';
import 'ConfigsPage.dart';
import 'SignalR.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ConfigsPage());
      case '/SignalR':
        return MaterialPageRoute(builder: (_) => SignalR());
      case '/ForgotPasswordPage':
        // return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
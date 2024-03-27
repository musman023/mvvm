import 'package:flutter/material.dart';
import 'package:mvvmapp/utils/routes/routes_name.dart';
import 'package:mvvmapp/view/home_screen.dart';
import 'package:mvvmapp/view/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined!"),
            ),
          );
        });
    }
  }
}

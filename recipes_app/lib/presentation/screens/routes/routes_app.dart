import 'package:flutter/material.dart';

import 'package:recipes_app/presentation/screens/home_screen.dart';

import '../detail_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case "/detail_screen":
        return MaterialPageRoute(builder: (_) => DetailScreen());
    }

    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}

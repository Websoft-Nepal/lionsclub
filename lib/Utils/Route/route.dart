import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Second_Dashboard/dashboard.dart';
import 'package:lionsclub/Screens/Dashboard/dashboard_main.dart';
import 'package:lionsclub/Utils/Route/route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.mainDashBoard:
        return MaterialPageRoute(
            builder: (BuildContext context) => MainBoard());

      case RoutesName.secondaryDashBoard:
        return MaterialPageRoute(
            builder: (BuildContext context) => Dashboard());


      // case RoutesName.home:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('Null route'),
            ),
          );
        });
    }
  }
}

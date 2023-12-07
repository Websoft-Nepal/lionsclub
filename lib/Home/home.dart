import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lionsclub/Screens/Dashboard/Zonal_directory.dart';
import 'package:lionsclub/Screens/Dashboard/dIstrict_directory.dart';
import 'package:lionsclub/Screens/Home/dashboard.dart';
import 'package:lionsclub/Screens/Home/dashboard_main.dart';
import 'package:lionsclub/Screens/about.dart';
import 'package:lionsclub/Screens/notification.dart';

import '../Screens/Dashboard/clubs.dart';
import '../main.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF11468F),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/logo.png')),
                      Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/logo.png')),
                      Spacer(),
                    ],
                  ),
                  Text(
                    'LION CLUB',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.dashboard,color: sColor,),
                  SizedBox(width: 10),
                  Text(
                    'Dashboard',
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.store_mall_directory,color: sColor,),
                  SizedBox(width: 10),
                  Text(
                    'District Directory',
                    style: TextStyle(color: Color(0xFF141414)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => District_Directory()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.people,color: sColor),
                  SizedBox(width: 10),
                  Text(
                    'Clubs',
                    style: TextStyle(color: Color(0xFF141414)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Club()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.map,color: sColor,),
                  SizedBox(width: 10),
                  Text(
                    'Zonal Directory',
                    style: TextStyle(color: Color(0xFF141414)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ZonalD()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            Container(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Notice()),
                  );
                },
                child:Stack(
                  children: [
                    Icon(Icons.notifications, color: zColor),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 12,
                      child: Container(

                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1), // Adjust border color and width
                        ),
                        child: badges.Badge(
                          badgeContent: Text(''),
                          // elevation: 0, // Set elevation to 0 to remove shadow
                          // padding: EdgeInsets.all(2), // Adjust padding as needed
                        ),
                      ),
                    ),
                  ],
                )

              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        elevation: 1,
        height: 60,
        indicatorColor: Colors.white10,
        backgroundColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: sColor,
              size: 30,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: sColor,
              size: 30,
            ),
            label: 'Home',
          ),
          NavigationDestination(
              // selectedIcon: Icon(Icons.settings,color: Colors.blue,size:30,),
              selectedIcon: Icon(
                Icons.person,
                color: sColor,
                size: 30,
              ),
              icon: Icon(
                Icons.person_outlined,
                color: sColor,
                size: 30,
              ),
              label: 'Profile'),
        ],
      ),
      body: <Widget>[
        Container(
          child: MainBoard(),
        ),
        Container(
          child:Dashboard() ,
        ),
      ][currentPageIndex],
    );
  }
}

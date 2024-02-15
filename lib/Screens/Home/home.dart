import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lionsclub/Screens/Dashboard/District/directiry_listtile.dart';
import 'package:lionsclub/Screens/Dashboard/donor/donor_screen.dart';
import 'package:lionsclub/Screens/Dashboard/zone_directory.dart';
import 'package:lionsclub/Screens/Dashboard/District/department_details.dart';
import 'package:lionsclub/Screens/Dashboard/District/department.dart';
import 'package:lionsclub/Screens/Second_Dashboard/dashboard.dart';
import 'package:lionsclub/Screens/Dashboard/dashboard_main.dart';
import 'package:lionsclub/Screens/Dashboard/news/news.dart';
import '../Dashboard/club/clubs.dart';
import '../../main.dart';
import '../Dashboard/region_directory.dart';

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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF11468F),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/logo.png')),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/districk325M.png')),

                    ],
                  ),
                  Text(
                    'LION CLUB',
                    style: TextStyle(
                        fontSize: 20,
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
              title: const Row(
                children: [
                  Icon(Icons.store,color: sColor,),
                  SizedBox(width: 10),
                  Text(
                    'Region Directory',
                    style: TextStyle(color: Color(0xFF141414)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegionDepartmentScreen()),
                );
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.location_on,color: sColor,),
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
                  MaterialPageRoute(builder: (context) => Listtile()),
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
                  MaterialPageRoute(builder: (context) => Zone_Directory()),
                );
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.done_all_rounded,color: sColor,),
                  SizedBox(width: 10),
                  Text(
                    'Donor',
                    style: TextStyle(color: Color(0xFF141414)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Donor_Screen()),
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
                height: 60, width: 60, child: Image.asset('assets/logo.png')),
            Container(
                height: 70, width: 70, child: Image.asset('assets/districk325M.png')),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => News()),
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
        elevation: 0.3,
        height: 65,
        indicatorColor: Colors.white,
        backgroundColor: Colors.white12,
        // surfaceTintColor: Colors.white24,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: zColor,
              size: 30,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: zColor,
              size: 30,
            ),
            label: 'Home',
          ),
          NavigationDestination(
              // selectedIcon: Icon(Icons.settings,color: Colors.blue,size:30,),
              selectedIcon: Icon(
                Icons.person,
                color: zColor,
                size: 30,
              ),
              icon: Icon(
                Icons.person_outlined,
                color: zColor,
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

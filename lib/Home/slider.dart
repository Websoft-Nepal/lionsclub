import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            const DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.blue,
              ),
              child: Text('leo',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
            ListTile(
              title: const Text('Home',

              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:   Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
      body: Container(
        // Replace this Container with your actual content.
        child: Center(
          child: Text('Your Body Content Here'),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('About Screen Content'),
      ),
    );
  }
}

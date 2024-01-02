import 'package:flutter/material.dart';

import '../main.dart';
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF11468F),
        title: Row(
          children: [
            SizedBox(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            const Spacer(),
            const Text(
              'District Directory',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(
              flex: 2,


            )
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1.9, // Width to height ratio of each item
        ),
        itemCount: 20, // Number of items
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem(index);
        },
      ),
    );
  }
  Widget _buildGridItem(int index) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: sColor,
        borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
      ),
      child: Center(
        child: Text('Item $index',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

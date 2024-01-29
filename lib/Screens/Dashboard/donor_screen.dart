import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/District/donor_details_screen.dart';

import '../../data/network/api_services.dart';
import '../../main.dart';
import 'package:lionsclub/data/Models/donor.dart';

class Donor_Screen extends StatefulWidget {
  const Donor_Screen({super.key});

  @override
  State<Donor_Screen> createState() => _Donor_ScreenState();
}

class _Donor_ScreenState extends State<Donor_Screen> {
  List<Donor> donors = [];
  bool isDonorLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDonorData("https://api.lionsclubsdistrict325jnepal.org.np/api/donor");
  }

  Future<void> _fetchDonorData(String apiUrl) async {
    try {
      List<Donor> donorData = await ApiService.fetchData(
        apiUrl,
        (data) => Donor.fromJson(data),
      );
      setState(() {
        donors = donorData;
        isDonorLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isDonorLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(
          children: [
            Container(
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            SizedBox(
              width: 5,
            ),
            Text(
              'Donor',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(donors[index].id.toString() ?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
            title: Text(donors[index].title ?? 'No Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),), // Provide a default value if title is null
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DonorDetails(dId: donors[index].id,name: donors[index].title ?? 'Title $index',)),
              );
            },
          );
        },
      )

    );
  }
}

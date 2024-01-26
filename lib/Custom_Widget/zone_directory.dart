import 'package:flutter/material.dart';
import 'package:lionsclub/data/Models/department/zonal.dart';

import '../Utils/Components/appurl.dart';
import '../data/network/api_services.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';
import '../main.dart';

class Zone_Directory extends StatefulWidget {
  const Zone_Directory({Key? key}) : super(key: key);

  @override
  State<Zone_Directory> createState() => _Zone_DirectoryState();
}

class _Zone_DirectoryState extends State<Zone_Directory> {
  List<Zone> zones = [];
  bool isZonesLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchZoneData(AppUrl.zoneDepartmentEndPoint);
  }

  Future<void> _fetchZoneData(String apiUrl) async {
    try {
      List<Zone> zoneData = await ApiService.fetchData(
        apiUrl,
            (data) => Zone.fromJson(data), // Adjust the Zone model accordingly
      );
      setState(() {
        zones = zoneData;
        isZonesLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isZonesLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF11468F),
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              'Zone Directory',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: zones.length,
        itemBuilder: (context, index) {
          Zone zone = zones[index];
          return Card(
            elevation: 5,
            surfaceTintColor: Colors.white,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            zone.memberName ?? 'No Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: sColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:8.0),
                            child: Text(
                              zone.designation ?? 'No Post',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF141414),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(zone.photo ?? ''),
                      ),
                    ],
                  ),
                  // Display club names below the CircleAvatar
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0,left:8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Club Names:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: sColor,
                          ),
                        ),
                        // Display club names using a ListView.builder
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: zone.clubs?.length ?? 0,
                          itemBuilder: (context, clubIndex) {
                            return Row(
                              children: [
                                Text('•'),
                                Text(zone.clubs?[clubIndex].name ?? 'No Club Name',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: tColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

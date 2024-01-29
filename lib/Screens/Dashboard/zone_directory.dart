import 'package:flutter/material.dart';
import 'package:lionsclub/data/Models/department/zonal.dart';
import 'package:lionsclub/main.dart';
import '../../Utils/Components/appurl.dart';
import '../../data/network/api_services.dart';
import 'package:shimmer/shimmer.dart';

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
    _fetchZoneData("https://api.lionsclubsdistrict325jnepal.org.np/api/zone"); // Use the zone API endpoint
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
            ),
          ],
        ),
      ),
      body: isZonesLoading
          ? _buildShimmerLoadingSkeleton()
          : ListView.builder(
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
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              zone.designation ?? 'No Post',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: tColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(zone.photo ?? ''),
                      ),
                    ],
                  ),
                  // Display club names below the CircleAvatar
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Club Names :',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: tColor,
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
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  zone.clubs?[clubIndex].name ?? 'No Club Name',
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

  Widget _buildShimmerLoadingSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 5, // Placeholder for 5 items
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            surfaceTintColor: Colors.grey[300],
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 16,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: 100,
                              height: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Display club names below the CircleAvatar
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 16,
                          color: Colors.white,
                        ),
                        // Display club names using a ListView.builder
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3, // Placeholder for 3 club names
                          itemBuilder: (context, clubIndex) {
                            return Row(
                              children: [
                                Text('•'),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 100,
                                  height: 14,
                                  color: Colors.white,
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

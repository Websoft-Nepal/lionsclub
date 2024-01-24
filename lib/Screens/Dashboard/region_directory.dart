import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/Club_member_widget.dart';
import 'package:lionsclub/data/Models/region_department.dart'; // Import your model classes
import '../../data/Models/department/region.dart';
import '../../data/network/api_services.dart';

class RegionDepartmentScreen extends StatefulWidget {
  @override
  _RegionDepartmentScreenState createState() => _RegionDepartmentScreenState();
}

class _RegionDepartmentScreenState extends State<RegionDepartmentScreen> {
  List<region_department> regionDepartments = [];

  @override
  void initState() {
    super.initState();
    _fetchData('https://api.lionsclubsdistrict325jnepal.org.np/api/department/region');
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<region_department> data = await ApiService.fetchData(apiUrl, (data) => region_department.fromJson(data));
      setState(() {
        regionDepartments = data;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
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
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            Text(
              'Regional Directory',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: regionDepartments.length,
        itemBuilder: (context, index) {
          return
            MyCustomClubMember(Name: regionDepartments[index].memberName != null &&
                regionDepartments[index].memberName!.length > 20
                ? regionDepartments[index].memberName!.substring(0, 20)
                : regionDepartments[index].memberName ?? 'Member Name', Post: regionDepartments[index].designation ?? 'Designation', Image:regionDepartments[index].photo ??'');
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/skeleton_member.dart';
import '../../../consts/app_consts.dart';
import '../../../data/Models/department/region.dart';
import '../../../data/network/api_services.dart';
import '../club/Club_member_widget.dart';

class RegionDepartmentScreen extends StatefulWidget {
  @override
  _RegionDepartmentScreenState createState() => _RegionDepartmentScreenState();
}

class _RegionDepartmentScreenState extends State<RegionDepartmentScreen> {
  List<region_department> regionDepartments = [];
  bool isLoading = true; // New variable to track loading state

  @override
  void initState() {
    super.initState();
    _fetchData('${AppConstants.baseURL}/department/region');
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<region_department> data = await ApiService.fetchData(
          apiUrl, (data) => region_department.fromJson(data));
      setState(() {
        regionDepartments = data;
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
      setState(() {
        isLoading = false;
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
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset('assets/logo_main.png'),
            ),
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              'Regional Directory',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      body: isLoading
          ? SkeletonMember()
          : ListView.builder(
              itemCount: regionDepartments.length,
              itemBuilder: (context, index) {
                return MyCustomClubMember(
                  Name: regionDepartments[index].memberName != null &&
                          regionDepartments[index].memberName!.length > 20
                      ? regionDepartments[index].memberName!.substring(0, 20)
                      : regionDepartments[index].memberName ?? 'Member Name',
                  Post: regionDepartments[index].designation ?? 'Designation',
                  Image: regionDepartments[index].photo ?? '',
                );
              },
            ),
    );
  }
}

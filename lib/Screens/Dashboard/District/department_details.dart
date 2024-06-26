import 'package:flutter/material.dart';
import 'package:lionsclub/consts/app_consts.dart';
import '../../../data/Models/department/department_details.dart';
import '../../../data/network/api_services.dart';
import '../../../main.dart';

class DepartmentDetails extends StatefulWidget {
  final dId, name;

  const DepartmentDetails({Key? key, required this.dId, this.name})
      : super(key: key);

  @override
  _DepartmentDetailsState createState() => _DepartmentDetailsState();
}

class _DepartmentDetailsState extends State<DepartmentDetails> {
  List<DepartmentDetail>? departmentDetails;
  bool isDepartmentDetailsLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDepartmentDetails();
  }

  Future<void> _fetchDepartmentDetails() async {
    try {
      List<DepartmentDetail>? details = await ApiService.fetchData(
        "${AppConstants.baseURL}/department_details/${widget.dId}",
        (data) => DepartmentDetail.fromJson(data),
      );
      setState(() {
        departmentDetails = details;
        isDepartmentDetailsLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isDepartmentDetailsLoading = false;
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo_main.png'),
            ),
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            Text(
              widget.name.length <= 20
                  ? widget.name
                  : widget.name.substring(0, 20) + '...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: departmentDetails?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem(index);
        },
      ),
    );
  }

  Widget _buildGridItem(int index) {
    DepartmentDetail? detail = departmentDetails![index];

    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 49.0,
                foregroundImage:
                    NetworkImage(detail.memberDetails?.photo ?? ''),
                backgroundImage: const AssetImage('assets/logo.png'),
              ),
            ),
            Text(
              detail.memberDetails?.name ?? 'No Name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              detail.officer?[0].title ?? 'No Post',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w700, color: sColor),
            ),
          ],
        ),
      ),
    );
  }
}

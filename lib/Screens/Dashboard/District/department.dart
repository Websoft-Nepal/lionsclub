import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lionsclub/Screens/Dashboard/District/department_details.dart';
import 'package:lionsclub/data/Models/department/department.dart';
import '../../../data/network/api_pdfServices.dart';
import '../../../data/network/api_services.dart';
import '../../../main.dart';

class District_Directory extends StatefulWidget {
  const District_Directory({super.key});

  @override
  State<District_Directory> createState() => _District_DirectoryState();
}

class _District_DirectoryState extends State<District_Directory> {
  late String localPath;
  List<department> directories = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData("https://api.lionsclubsdistrict325jnepal.org.np/api/department");
    ApiServiceProvider.loadPDF().then((value) {
      setState(() {
        localPath = value;
      });
    });

  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<department> data =
      await ApiService.fetchData(apiUrl, (data) => department.fromJson(data));
      setState(() {
        directories = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: sColor,
      //   title: Row(
      //     children: [
      //       SizedBox(
      //         height: 60,
      //         width: 60,
      //         child: Image.asset('assets/logo_main.png'),
      //       ),
      //       SizedBox(
      //         height: 50,
      //         width: 50,
      //         child: Image.asset('assets/logo.png'),
      //       ),
      //       SizedBox(
      //         width: 5,
      //       ),
      //       Text(
      //         'District Directory',
      //         style: TextStyle(color: Colors.white),
      //       ),
      //       Spacer(
      //         flex: 2,
      //       ),
      //     ],
      //   ),
      // ),
      body: isLoading
          ? _buildSkeletonLoading()
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          childAspectRatio: 1.9, // Width to height ratio of each item
        ),
        itemCount: directories.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildGridItem(index);
        },
      ),
    );
  }

  Widget _buildSkeletonLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.9,
        ),
        itemCount: 24, // Adjust the number of skeleton items as needed
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(15.0),
            child: Card(
              color: sColor,
              elevation: 5,
              child: Center(
                child: Text(
                  'Loading',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridItem(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DepartmentDetails(dId: directories[index].id,name: directories[index].title ?? 'Title $index',)),
        );
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Card(
          color: sColor,
          elevation: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                directories[index].title ?? 'Title $index',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

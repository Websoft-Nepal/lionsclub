import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/pdfviewer.dart';
import 'package:lionsclub/Custom_Widget/skeleton_member.dart';
import 'package:lionsclub/Screens/Dashboard/donor/donor_details_screen.dart';
import 'package:lionsclub/Utils/Components/appurl.dart';

import '../../../data/network/api_services.dart';
import '../../../main.dart';
import 'package:lionsclub/data/Models/donor.dart';

class District_pdf extends StatefulWidget {
  const District_pdf({super.key});

  @override
  State<District_pdf> createState() => _District_pdfState();
}

class _District_pdfState extends State<District_pdf> {
  List<Donor> donors = [];
  bool isDonorLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDonorData(AppUrl.donorEndPoint);
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
        body: isDonorLoading?const SkeletonMember():ListView.builder(
          itemCount: donors.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              surfaceTintColor: pColor,
              // color: zColor,
              child: ListTile(
                // tileColor: ,
                leading: Text(donors[index].id.toString()+'.' ?? '',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                title: Text(donors[index].title ?? 'No Title',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),), // Provide a default value if title is null
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomPDFViewer(pdfUrl: 'https://www.ibm.com/downloads/cas/GJ5QVQ7X', title: 'pdf')),
                  );
                },
              ),
            );
          },
        )

    );
  }
}

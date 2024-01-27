import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/skeleton_member.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../main.dart';
import '../../Custom_Widget/FocusProgram_widgetforlist.dart';
import '../../Custom_Widget/Focus_Details.dart';
import '../../Custom_Widget/notiication.dart';
import '../../Utils/Components/appurl.dart';
import '../../data/Models/program.dart';
import '../../data/network/api_services.dart';
import '../../view_model/FocusProgram.dart';

class FocusList extends StatefulWidget {
  const FocusList({Key? key});

  @override
  State<FocusList> createState() => _FocusListState();
}

class _FocusListState extends State<FocusList> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData(AppUrl.programEndPoint);
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<program> data = await ApiService.fetchData(apiUrl, (data) => program.fromJson(data));
      Provider.of<ProgramProvider>(context, listen: false).setPrograms(data);
      setState(() {
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
    final programProvider = Provider.of<ProgramProvider>(context);
    final programs = programProvider.programs;

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            Spacer(),
            const Text(
              'Focus Program',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: isLoading
          ? SkeletonMember()
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: programs.length,
          itemBuilder: (context, index) {
            return FocusPrograms(
              Title: programs[index].title ?? 'No Title',
              ImageURl: programs[index].photo!,  // Assuming imageUrl is a property in your Program class
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FocusProgram_Details(
                      title: programs[index].title!,
                      imageUrl: programs[index].photo!,
                      description: programs[index].detail!, date: programs[index].postDate!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

}

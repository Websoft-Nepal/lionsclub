import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/Screens/Dashboard/FocusProgramList.dart';
import 'package:lionsclub/Screens/Dashboard/donor_screen.dart';
import 'package:lionsclub/Screens/Dashboard/zone_directory.dart';
import 'package:lionsclub/Screens/Dashboard/District/department_details.dart';
import 'package:lionsclub/Screens/Dashboard/club/clubs.dart';
import 'package:lionsclub/Screens/Dashboard/District/department.dart';
import 'package:lionsclub/Screens/Dashboard/region_directory.dart';
import 'package:lionsclub/Screens/Home/News%20_crausel/Crausel.dart';
import 'package:lionsclub/Screens/Dashboard/notification.dart';
import 'package:lionsclub/main.dart';
import 'package:provider/provider.dart';
import '../../Custom_Widget/Focus_program_widget.dart';
import '../../Custom_Widget/icon.dart';
import '../../Utils/Components/appurl.dart';
import '../../data/Models/program.dart';
import '../../data/network/api_services.dart';
import '../../view_model/FocusProgram.dart';
import 'message.dart';

class MainBoard extends StatefulWidget {
   MainBoard({super.key});
  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  List<program> programs = [];
  void initState() {
    super.initState();
    // Example usage with a different URL for programs
    _fetchProgramData(AppUrl.programEndPoint);
  }

  Future<void> _fetchProgramData(String apiUrl) async {
    try {
      List<program> programData = await ApiService.fetchData(apiUrl, (data) => program.fromJson(data));
      Provider.of<ProgramProvider>(context, listen: false).setPrograms(programData);
      setState(() {
        programs = programData;
      });
    } catch (e) {
      // Handle error
      print('Error fetching program data: $e');
    }
  }

  final imageUrls = [
    "assets/c1.jpg",
    "https://www.gpo.gov.np/images/uploaded/imagepath/6e597028-8799-4e7f-b115-504eb18305f81f5e9d24-e40b-474e-9bb6-23e53679fbbe74603fbe-dd44-4c7a-9408-0fa1a9b8a027423394eb-53e0-44d3-9dbf-9522ad6067a8gpo.jpg"
    "https://oag.gov.np/uploads/OAG%2013.jpg"
  ];


  @override
  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        // -->1st
        // ClipRRect(
        //     borderRadius: BorderRadius.circular(200),
        //     child: Image.asset('assets/officer.png',fit: BoxFit.fill,)),
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text('Welcome to Lions District 325 m,Nepal',style: TextStyle(color: sColor,fontWeight: FontWeight.bold,fontSize: 21),),
     ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('"Lead With Empathy"',style: TextStyle(color: tColor,fontSize:18,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.asset(
                'assets/c1.jpg',
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) {
                // Handle page change
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),


        const Padding(
          padding: EdgeInsets.only(left: 8.0,right: 8,top:8,bottom: 20),
          child: Text('Dashboard',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
         Padding(
          padding: EdgeInsets.only(left:18.0,right: 18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomIconButton(
                    icon: Icons.person,
                    color: zColor,
                    iconName: '     Hello\nChairman', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Message()));
                    },
                  ),

                  MyCustomIconButton(
                    icon:Icons.people,
                    color: sColor,
                    iconName: 'Clubs', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Club()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.map,
                    color: pColor,
                    iconName: '   Zonal\nDirectory', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Zone_Directory()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.newspaper,
                    color: ttColor,
                    iconName: 'News', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Notice()));
                    },
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomIconButton(
                    icon:Icons.location_on,
                    color: pColor,
                    iconName: '  District\nDirectory', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  District_Directory()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.store,
                    color: zColor,
                    iconName: ' Regional\nDirectory', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegionDepartmentScreen()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.center_focus_strong,
                    color: sColor,
                    iconName: '   Focus\nProgram ', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  FocusList()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.done_all_rounded,
                    color: Colors.greenAccent,
                    iconName: ' Donor', // You can pass the icon name dynamically
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Donor_Screen()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 15,),
        // -->2nd
        Padding(
          padding: const EdgeInsets.only(right:8.0,left: 8.0,top: 8.0,bottom: 0),
          child: Row(
            children: [
              const Text('Focus Program',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              const Spacer(),

              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FocusList()));
              }, icon: Icon(Icons.arrow_forward,color: zColor,))
              // TextButton(onPressed: () {  },
              // child: const Text('View more',style: TextStyle(fontSize: 14,color:zColor),))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              programs.length,
                  (index) => ProgramCard(
                title: programs[index].title ?? 'No Title',
                imageUrl: programs[index].photo ?? '', description: programs[index].detail?? '', date: programs[index].postDate?? '',
              ),
            ),
          ),
        ),

        const SizedBox(height: 15,),
        // -->2nd
        Padding(
          padding: const EdgeInsets.only(right:8.0,left: 8.0,top: 8.0,bottom: 0),
          child: Row(
            children: [
              const Text('Latest News ',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              const Spacer(),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notice()));
              }, icon:Icon(Icons.arrow_forward,color: zColor,))
            ],
          ),
        ),

        Crausel_news(),


            ],
          ),
        );
  }
}

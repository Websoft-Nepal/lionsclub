import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/Screens/Dashboard/focus_program/FocusProgramList.dart';
import 'package:lionsclub/Screens/Dashboard/donor/donor_screen.dart';
import 'package:lionsclub/Screens/Dashboard/zone_directory.dart';
import 'package:lionsclub/Screens/Dashboard/District/department_details.dart';
import 'package:lionsclub/Screens/Dashboard/club/clubs.dart';
import 'package:lionsclub/Screens/Dashboard/District/department.dart';
import 'package:lionsclub/Screens/Dashboard/region_directory.dart';
import 'package:lionsclub/Screens/Home/News%20_crausel/Crausel.dart';
import 'package:lionsclub/Screens/Dashboard/news/news.dart';
import 'package:lionsclub/main.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';
import 'focus_program/Focus_program_widget.dart';
import '../../Custom_Widget/icon.dart';
import '../../Utils/Components/appurl.dart';
import '../../data/Models/program.dart';
import '../../data/network/api_services.dart';
import '../../view_model/FocusProgram.dart';
import 'message.dart';

class MainBoard extends StatefulWidget {
   const MainBoard({super.key});
  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  bool isLoading = true;
  bool _isConnected = true;
  List<program> programs = [];
  void initState() {
    super.initState();
    _checkInternetConnection();
    _fetchProgramData(AppUrl.programEndPoint);
  }
  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }
  Future<void> _fetchProgramData(String apiUrl) async {
    try {
      List<program> programData = await ApiService.fetchData(apiUrl, (data) => program.fromJson(data));
      Provider.of<ProgramProvider>(context, listen: false).setPrograms(programData);
      setState(() {

        programs = programData;
      });
      isLoading = false;
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error fetching program data: $e');
      }
    }
  }

  final imageUrls = [
    "assets/c1.jpg",
    "https://www.gpo.gov.np/images/uploaded/imagepath/6e597028-8799-4e7f-b115-504eb18305f81f5e9d24-e40b-474e-9bb6-23e53679fbbe74603fbe-dd44-4c7a-9408-0fa1a9b8a027423394eb-53e0-44d3-9dbf-9522ad6067a8gpo.jpg"
    "https://oag.gov.np/uploads/OAG%2013.jpg"
  ];


  @override
  Widget build(BuildContext context) {
        return _isConnected ?Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        // -->1st
        // ClipRRect(
        //     borderRadius: BorderRadius.circular(200),
        //     child: Image.asset('assets/officer.png',fit: BoxFit.fill,)),
     const Padding(
       padding: EdgeInsets.all(8.0),
       child: Text('Welcome to Lions District 325 m,Nepal',style: TextStyle(color: sColor,fontWeight: FontWeight.bold,fontSize: 21),),
     ),
        const Padding(
          padding: EdgeInsets.all(8.0),
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
          padding: const EdgeInsets.only(left:18.0,right: 18),
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
                    iconName: 'Clubs',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Club()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.map,
                    color: pColor,
                    iconName: '   Zonal\nDirectory',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Zone_Directory()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.newspaper,
                    color: ttColor,
                    iconName: 'News',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const News()));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomIconButton(
                    icon:Icons.location_on,
                    color: pColor,
                    iconName: '  District\nDirectory',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const District_Directory()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.store,
                    color: zColor,
                    iconName: ' Regional\nDirectory',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  RegionDepartmentScreen()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.center_focus_strong,
                    color: sColor,
                    iconName: '   Focus\nProgram ',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const FocusList()));
                    },
                  ),
                  MyCustomIconButton(
                    icon:Icons.done_all_rounded,
                    color: Colors.greenAccent,
                    iconName: ' Donor',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Donor_Screen()));
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
        isLoading ? _buildLoadingIndicator():SingleChildScrollView(
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>News()));
              }, icon:Icon(Icons.arrow_forward,color: zColor,))
            ],
          ),
        ),

        Crausel_news(),


            ],
          ),
        ):_buildNoInternetScreen();
  }
  Widget _buildNoInternetScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 100,
            color: Colors.red,
          ),
          SizedBox(height: 20),
          Text(
            'No Internet Connection',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _checkInternetConnection();
            },
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
  Widget _buildLoadingIndicator() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 300.0,
          viewportFraction: 0.8,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 7),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: 5, // Number of skeleton items
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return buildSkeletonItem();
        },
      ),
    );
  }
  Widget buildSkeletonItem() {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 250,
              height: 150,
              color: Colors.grey, // Skeleton color
            ),
            SizedBox(height: 10),
            Container(
              height: 10,
              width: 150,
              color: Colors.grey, // Skeleton color
            ),
            SizedBox(height: 5),
            Container(
              height: 10,
              width: 100,
              color: Colors.grey, // Skeleton color
            ),
          ],
        ),
      ),
    );
  }
}

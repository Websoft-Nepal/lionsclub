import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/pdfviewer.dart';
import 'package:lionsclub/Screens/Dashboard/District/district_main_directory.dart';
import 'package:lionsclub/Screens/Dashboard/focus_program/FocusProgramList.dart';
import 'package:shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/Screens/Dashboard/club/clubs.dart';
import 'package:lionsclub/Screens/Home/News%20_crausel/Crausel.dart';
import 'package:lionsclub/Screens/Dashboard/news/news.dart';
import 'package:lionsclub/main.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';
import '../../consts/app_consts.dart';
import 'focus_program/FocusProgram_Details.dart';
import '../../Utils/Components/appurl.dart';
import '../../data/Models/program.dart';
import '../../data/network/api_services.dart';
import '../../view_model/FocusProgram.dart';
import 'package:http/http.dart' as http;

class MainBoard extends StatefulWidget {
  const MainBoard({super.key});
  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  bool isLoading = true;
  bool _isConnected = true;
  bool isPadhooAviyanLoading = false;
  bool isBloodBankLoading = false;

  List<program> programs = [];
  void initState() {
    super.initState();
    _checkInternetConnection();
    _fetchProgramData(AppUrl.programEndPoint);
  }

  String breakText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      String firstPart = text.substring(0, maxLength);
      String secondPart = text.substring(maxLength);
      return '$firstPart\n$secondPart';
    }
  }

  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  Future<void> _fetchProgramData(String apiUrl) async {
    try {
      List<program> programData =
          await ApiService.fetchData(apiUrl, (data) => program.fromJson(data));
      Provider.of<ProgramProvider>(context, listen: false)
          .setPrograms(programData);
      setState(() {
        programs = programData;
      });
      isLoading = false;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching program data: $e');
      }
    }
  }

  fetchPadhaooAviyanPdf(
    BuildContext context,
  ) async {
    try {
      var res = await http.get(
        Uri.parse("${AppConstants.baseURL}/padauabiyan/list"),
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomPDFViewer(
              pdfUrl: data['pdf'],
              title: 'Padhoo Aviyan',
            ),
          ),
        );
      } else {
        throw Exception('Error fetching PDF');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching PDF'),
        ),
      );
    }
  }

  fetchBloodBankPdf(
    BuildContext context,
  ) async {
    try {
      var res = await http.get(
        Uri.parse("${AppConstants.baseURL}/bloodbank/list"),
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomPDFViewer(
              pdfUrl: data['pdf'],
              title: 'Blood Bank',
            ),
          ),
        );
      } else {
        throw Exception('Error fetching PDF');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching PDF'),
        ),
      );
    }
  }

  final imageUrls = [
    "assets/c1.jpg",
    "https://www.gpo.gov.np/images/uploaded/imagepath/6e597028-8799-4e7f-b115-504eb18305f81f5e9d24-e40b-474e-9bb6-23e53679fbbe74603fbe-dd44-4c7a-9408-0fa1a9b8a027423394eb-53e0-44d3-9dbf-9522ad6067a8gpo.jpg"
        "https://oag.gov.np/uploads/OAG%2013.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final programProvider = Provider.of<ProgramProvider>(context);
    final programs = programProvider.programs;
    return _isConnected
        ? Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text(
                    'Lions Clubs International \nDistrict 325M, Nepal',
                    style: TextStyle(
                        color: sColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 8),
                  child: Text(
                    '"Together We Can"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: tColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150.0),
                        bottomRight: Radius.circular(150.0),
                      ),
                      child: Image.asset('assets/officerlion.jpg')),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18, top: 30),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    height: 300,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 50,
                      addRepaintBoundaries: true,
                      addSemanticIndexes: true,
                      childAspectRatio: 1.5,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Club()));
                          },
                          child: Card(
                            color: sColor,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Text(
                                    'Clubs',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        District_main_directory()));
                          },
                          child: Card(
                            color: sColor,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'District Directory',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => News()));
                          },
                          child: Card(
                            color: sColor,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.newspaper,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  Text(
                                    'News',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (isPadhooAviyanLoading) return;
                            setState(() {
                              isPadhooAviyanLoading = true;
                            });

                            await fetchPadhaooAviyanPdf(context);

                            setState(() {
                              isPadhooAviyanLoading = false;
                            });
                          },
                          child: Card(
                            color: sColor,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (isPadhooAviyanLoading)
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  else
                                    Icon(
                                      Icons.menu_book,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  Expanded(
                                    child: Text(
                                      'Padhoo Aviyan',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (isBloodBankLoading) return;
                            setState(() {
                              isBloodBankLoading = true;
                            });

                            await fetchBloodBankPdf(context);

                            setState(() {
                              isBloodBankLoading = false;
                            });
                          },
                          child: Card(
                            color: sColor,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (isBloodBankLoading)
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  else
                                    Icon(
                                      Icons.bloodtype_rounded,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  Expanded(
                                    child: Text(
                                      'Blood Bank',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Focus Programs ',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FocusList()));
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: zColor,
                              ))
                        ],
                      ),
                      isLoading
                          ? _buildLoadingIndicator()
                          : Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ...List.generate(
                                      programs.length,
                                      (index) {
                                        final program = programs[index];
                                        return Card(
                                          // color: zColor,
                                          surfaceTintColor: sColor,
                                          child: ListTile(
                                            leading:
                                                Icon(Icons.done_all_rounded),
                                            title: Text(
                                              program.title!,
                                              style: TextStyle(
                                                color: sColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      FocusProgram_Details(
                                                    title: program.title!,
                                                    imageUrl: program.photo!,
                                                    description:
                                                        program.detail!,
                                                    date: program.postDate!,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest News ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => News(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          color: zColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Crausel_news(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider.builder(
                    itemCount: imageUrls.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
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
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
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
                // -->2nd
                // Padding(
                //   padding: const EdgeInsets.only(right:8.0,left: 8.0,top: 8.0,bottom: 0),
                //   child: Row(
                //     children: [
                //       const Text('Focus Program',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
                //       const Spacer(),
                //
                //       IconButton(onPressed: (){
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>FocusList()));
                //       }, icon: Icon(Icons.arrow_forward,color: zColor,))
                //       // TextButton(onPressed: () {  },
                //       // child: const Text('View more',style: TextStyle(fontSize: 14,color:zColor),))
                //     ],
                //   ),
                // ),
                // isLoading ? _buildLoadingIndicator():SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: List.generate(
                //       programs.length,
                //           (index) => ProgramCard(
                //         title: programs[index].title ?? 'No Title',
                //         imageUrl: programs[index].photo ?? '', description: programs[index].detail?? '', date: programs[index].postDate?? '',
                //       ),
                //     ),
                //   ),
                // ),

                const SizedBox(
                  height: 15,
                ),
                // -->2nd
              ],
            ),
          )
        : _buildNoInternetScreen();
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

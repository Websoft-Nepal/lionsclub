import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/Club_member_widget.dart';
import 'package:lionsclub/Screens/Dashboard/club_member.dart';
import 'package:lionsclub/Utils/Components/appurl.dart';
import 'package:lionsclub/main.dart';
import 'package:lionsclub/data/Models/club.dart';
import 'package:shimmer/shimmer.dart';
import '../../Custom_Widget/club_details.dart';
import '../../data/network/api_services.dart';

class Club extends StatefulWidget {
  @override
  State<Club> createState() => _ClubState();
}

class _ClubState extends State<Club> {
  List<club> clubs = [];
bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchData(AppUrl.clubEndPoint);
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<club> data = await ApiService.fetchData(apiUrl, (data) => club.fromJson(data));
      setState(() {
        clubs = data;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
      setState(() {
        isLoading = false; // Set loading state to false when there's an error
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
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(width: 5,),
            Text(
              'Clubs',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // -->Search
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: SizedBox(
                width: 300,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // 1 section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Clubs: ${clubs.length}'),
          ),
          // List Builder for Clubs
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: clubs.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ClubDetAILS(club: clubs[index])),
                  // );
                },
                child:Padding(
                  padding: const EdgeInsets.only(right: 18.0,left: 18,top: 8),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClubDetailsScreen(clubId: clubs[index].id.toString())),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8,left: 8,bottom: 5),
                                  child: Text(
                                    clubs[index].name != null && clubs[index].name!.length > 20
                                        ? clubs[index].name!.substring(0, 20)
                                        : clubs[index].name ?? '',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF141414),
                                    ),
                                  )

                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Charter Date ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                // fontWeight: FontWeight.w800,
                                                color: Color(0xFF141414)),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(  clubs[index].charterDate ?? '',style: TextStyle(fontWeight: FontWeight.w100,color: Color(0xFF666666)),)
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          Text(
                                            'Member',
                                            style: TextStyle(
                                                fontSize: 16,
                                                // fontWeight: FontWeight.w800,
                                                color: Color(0xFF141414)),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(  clubs[index].memberCount.toString()?? '',style: TextStyle(color: Color(0xFF666666)),)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Spacer(flex: 4,),
                          Container(height: 80, child: Image.asset('assets/logo.png')),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                )
              );
            },
          ),
        ],
      ),
    );
  }

    Widget _buildskeleton() {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6, // Adjust the number of skeleton items as needed
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18, top: 8),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200, // Adjust the width as needed
                            height: 20, // Adjust the height as needed
                            color: Colors.grey[300]!,
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 150, // Adjust the width as needed
                            height: 16, // Adjust the height as needed
                            color: Colors.grey[300]!,
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80, // Adjust the width as needed
                                    height: 16, // Adjust the height as needed
                                    color: Colors.grey[300]!,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: 80,
                                    height: 16,
                                    color: Colors.grey[300]!,
                                  ),
                                ],
                              ),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 16,
                                    color: Colors.grey[300]!,
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: 80,
                                    height: 16,
                                    color: Colors.grey[300]!,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(flex: 4),
                    Container(height: 80, width: 80, color: Colors.grey[300]!),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }



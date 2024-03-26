import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/club/club_details.dart';
import 'package:lionsclub/consts/app_consts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Custom_Widget/pdfviewer.dart';
import '../../../Utils/Components/appurl.dart';
import '../../../data/Models/club.dart';
import '../../../data/network/api_services.dart';
import '../../../main.dart';
import 'package:http/http.dart' as http;

class Club extends StatefulWidget {
  @override
  State<Club> createState() => _ClubState();
}

class _ClubState extends State<Club> {
  List<club> clubs = [];
  List<club> filteredClubs = [];
  bool isLoading = true;
  bool isPdfLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData(AppUrl.clubEndPoint);
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<club> data =
          await ApiService.fetchData(apiUrl, (data) => club.fromJson(data));
      if (mounted) {
        setState(() {
          clubs = data;
          filteredClubs = data; // Initially, filteredClubs is the same as clubs
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _filterClubs(String query) {
    setState(() {
      filteredClubs = clubs
          .where((club) =>
              club.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    });
  }

  fetchPdf(
    BuildContext context,
  ) async {
    try {
      var res = await http.get(
        Uri.parse("${AppConstants.baseURL}/clubpdf/list"),
      );

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomPDFViewer(
              pdfUrl: data['pdf'],
              title: 'Clubs',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: sColor,
        title: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset('assets/logo_main.png'),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Clubs',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      body: isLoading
          ? _buildSkeleton()
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: SizedBox(
                      width: 400,
                      child: TextField(
                        controller: searchController,
                        onChanged: _filterClubs,
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
                // Total Clubs
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Clubs: ${filteredClubs.length}',
                        textAlign: TextAlign.start,
                      ),
                      if (isPdfLoading)
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: CircularProgressIndicator(),
                        )
                      else
                        IconButton(
                          onPressed: () async {
                            if (isPdfLoading) return;
                            setState(() {
                              isPdfLoading = true;
                            });
                            await fetchPdf(
                              context,
                            );

                            setState(() {
                              isPdfLoading = false;
                            });
                          },
                          icon: Icon(
                            Icons.picture_as_pdf,
                          ),
                        ),
                    ],
                  ),
                ),
                // List Builder for Clubs
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredClubs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 18, top: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClubDetAILS(
                                  clubId: filteredClubs[index].id,
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 8, left: 8, bottom: 5),
                                        child: Text(
                                          filteredClubs[index].name != null &&
                                                  filteredClubs[index]
                                                          .name!
                                                          .length >
                                                      20
                                              ? filteredClubs[index]
                                                  .name!
                                                  .substring(0, 20)
                                                  .toLowerCase()
                                              : filteredClubs[index].name ?? '',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFF141414),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  'Charter Date ',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF141414),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  filteredClubs[index]
                                                          .charterDate ??
                                                      '',
                                                  style: TextStyle(
                                                    color: Color(0xFF666666),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              children: [
                                                Text(
                                                  'Member',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF141414),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  filteredClubs[index]
                                                      .memberCount
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color(0xFF666666),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  child: Image.asset('assets/logo.png'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildSkeleton() {
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
                          width: 200,
                          height: 20,
                          color: Colors.grey[300]!,
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: 150,
                          height: 16,
                          color: Colors.grey[300]!,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
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

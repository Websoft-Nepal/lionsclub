import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/news/News_details.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Utils/Components/appurl.dart';
import '../../../data/Models/news_events.dart';
import '../../../data/network/api_services.dart';
import '../../../main.dart';
import '../../../view_model/NewsEvents.dart';


class Crausel_news extends StatefulWidget {
  const Crausel_news({Key? key}) : super(key: key);

  @override
  State<Crausel_news> createState() => _Crausel_newsState();
}

class _Crausel_newsState extends State<Crausel_news> {
  List<newsevents> newsevent = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData(AppUrl.newsEndPoint);
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<newsevents> data = await ApiService.fetchData(apiUrl, (data) => newsevents.fromJson(data));
      Provider.of<NewsEventsProvider>(context, listen: false).setNewsEvents(data);
     if(mounted){
       setState(() {
        newsevent = data;
        isLoading = false;
      });
     }
    } catch (e) {
      // Handle error
      print('Error: $e');
      if(mounted){
        setState(() {
        isLoading = false;
      });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? _buildLoadingIndicator()
        : CarouselSlider.builder(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 7),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: newsevent.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final event = newsevent[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetails(title: event.title ?? 'No Title', imageUrl: event.photo??'', details: event.detail ?? 'No Details', date: event.updatedAt ?? 'No Details',)));
          },
          child: buildCarouselItem(event.photo ?? 'No Image', event.title ?? 'No Title', event.updatedAt?.substring(0,10)),
        );
      },
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

  Widget buildCarouselItem(String imageUrl, String title, Date) {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Text(Date, style: TextStyle(color: ttColor)),
                  Spacer(),
                  Text('more...', style: TextStyle(color: ttColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

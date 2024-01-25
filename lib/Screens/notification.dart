import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/notiication.dart';
import 'package:lionsclub/view_model/NewsEvents.dart';

import '../../main.dart';
import '../Custom_Widget/News_widget.dart';
import '../Utils/Components/appurl.dart';
import '../data/Models/news_events.dart';
import '../data/network/api_services.dart';
import 'package:provider/provider.dart';
class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  List<newsevents> newsEvents = [];

  @override
  void initState() {
    super.initState();
    _fetchData(AppUrl.newsEndPoint);
  }

  Future<void> _fetchData(String apiUrl) async {
    try {
      List<newsevents> data = await ApiService.fetchData(apiUrl, (data) => newsevents.fromJson(data));
      Provider.of<NewsEventsProvider>(context, listen: false).setNewsEvents(newsEvents);
      setState(() {
        newsEvents = data;
      });
    } catch (e) {
      // Handle error
      print('Error: $e');
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
                height: 50, width: 50, child: Image.asset('assets/logo.png')),
            Spacer(),
            const Text(
              'News',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),

      body:ListView.builder(
        itemCount: newsEvents.length,
        itemBuilder: (context, index) {
          return MyNotification(
            Title: newsEvents[index].title ?? '',
            ImageURl: newsEvents[index].photo ?? '', // Assuming 'photo' is the image URL property
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetails(
                    title: newsEvents[index].title ?? '',
                    imageUrl: newsEvents[index].photo ?? '', details: newsEvents[index].detail??'',
                  ),
                ),
              );
            }, Date:newsEvents[index].updatedAt??  '',
          );
        },
      ),
    );
  }

}

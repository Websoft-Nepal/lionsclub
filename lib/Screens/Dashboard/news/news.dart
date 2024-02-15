import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/news/news_widget.dart';
import 'package:lionsclub/view_model/NewsEvents.dart';
import '../../../../main.dart';
import 'News_details.dart';
import 'package:provider/provider.dart';
class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  @override
  Widget build(BuildContext context) {
    final newsEvents = Provider.of<NewsEventsProvider>(context).newsEvents;
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
              'News',
              style: TextStyle(color: Colors.white),
            ),
            Spacer(
              flex: 2,
            ),
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
                    title: newsEvents[index].title ?? 'No Title',
                    imageUrl: newsEvents[index].photo ?? '',
                    details: newsEvents[index].detail ?? 'No Details',
                    date: newsEvents[index].updatedAt ?? 'No Details',
                  // Assuming updatedAt is the date property
                  ),
                ),
              );
            }, Date:newsEvents[index].updatedAt?.substring(0,10)??  '',
          );
        },
      ),
    );
  }

}

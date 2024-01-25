import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/Screens/notification.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../../../view_model/NewsEvents.dart';

class Crausel_news extends StatefulWidget {
  const Crausel_news({Key? key}) : super(key: key);

  @override
  State<Crausel_news> createState() => _Crausel_newsState();
}

class _Crausel_newsState extends State<Crausel_news> {
  @override
  Widget build(BuildContext context) {
    final newsEventsProvider = Provider.of<NewsEventsProvider>(context);
    final newsevents = newsEventsProvider.newsEvents;

    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 0.8,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 7),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: newsevents.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return     Row(
          children: List.generate(
            newsevents.length,
                (index) => buildCarouselItem(
              title: newsevents[index].title ?? 'No Title',
              imageUrl: newsevents[index].photo ?? '',
                  date: newsevents[index].updatedAt ?? '',
            ),
          ),
        );},
    );
  }

  Widget buildCarouselItem({
    required String imageUrl,
    required String title,
    required String date,
  }) {
    return Container(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
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
                  Text(date, style: TextStyle(color: ttColor)),
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

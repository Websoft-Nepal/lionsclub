import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/Screens/notification.dart';

import '../../../main.dart';

class Crausel_news extends StatefulWidget {
  const Crausel_news({Key? key}) : super(key: key);

  @override
  State<Crausel_news> createState() => _Crausel_newsState();
}

class _Crausel_newsState extends State<Crausel_news> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 0.8,
        // enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 7),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,

      ),
      items: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Notice()));
          },
            child: buildCarouselItem('https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/367377413_372563901809892_1545061826286089042_n-768x1024.jpg', 'Scholarship Distribution For The hardworking students','Feb-01,2023')),
        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notice()));
            },
            child: buildCarouselItem('https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/385552352_1814252202337140_5702902529929741264_n-768x1024.jpg', 'Peace Poster Certificate Distribution PProgram at our club-24th December','Feb-01,2023')),
        GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notice()));
            },

            child: buildCarouselItem('https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/377222402_1586162258586403_642019498667824248_n-768x1024.jpg', 'Free Eye care & Sweater School uniform and first adi distribution','Feb-01,2023')),
        buildCarouselItem('https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/370118347_861529925459932_4931753913859187089_n-4-1024x768.jpg', 'Immediate pst international President Lion Brain E.Sheehan Visited','Feb-01,2023'),

      ],
    );
  }

  Widget buildCarouselItem(String imageUrl, String title,Date) {
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
                  Text(Date,style: TextStyle(color: ttColor),),
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

import 'package:flutter/material.dart';
import 'package:lionsclub/Custom_Widget/notiication.dart';

import '../../main.dart';
import '../Custom_Widget/News_widget.dart';
class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
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

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            MyNotification(ImageURl:'https://lionsclubkathmandu.org.np/wp-content/uplo'
                'ads/2023/12/373488214_177407775395066_3044932191628191524_n-5-1024x768.jpg',Title: 'Lions club int'
                'ernational district 325 j, Nepal third cabinet meeting 2022/023 presentation online open', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetails(
                    title: 'Lions club international district 325 j, Nepal third cabinet meeting 2022/023 presentation online open',
                    imageUrl: 'https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/373488214_177407775395066_3044932191628191524_n-5-1024x768.jpg',
                  ),
                ),
              );
            },),
            MyNotification(Title: 'Peace Poster Certificate Distribution Program at our club – 24th December 2023'
      'Free Eye Screening & Sweater, School Uniform, Stationary & First Aid Kit Distribution Program at Jalapa Devi Adharbhut Vidyalaya Shivapuri -5, Khukure, Nuwakot – 19th December, 2023￼'
       ' Immediate Past International President Lion Brian E. Sheehan Visited our Club – 01st December, 2023', ImageURl: 'https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/377222402_1586162258586403_64201'
                '9498667824248_n-768x1024.jpg', onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetails(
                    title:'Peace Poster Certificate Distribution Program at our club – 24th December 2023'
                        'Free Eye Screening & Sweater, School Uniform, Stationary & First Aid Kit Distribution Program at Jalapa Devi Adharbhut Vidyalaya Shivapuri -5, Khukure, Nuwakot – 19th December, 2023￼'
                        ' Immediate Past International President Lion Brian E. Sheehan Visited our Club – 01st December, 2023',
                    imageUrl: 'https://lionsclubkathmandu.org.np/wp-content/uploads/2023/12/373488214_177407775395066_3044932191628191524_n-5-1024x768.jpg',
                  ),
                ),
              );
            },)

          ],
        ),
      ),
    );
  }

}

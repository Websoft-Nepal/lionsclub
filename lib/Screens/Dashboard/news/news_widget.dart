import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';

class MyNotification extends StatelessWidget {
  final String Title;
  final String ImageURl;
  final String Date;
  final VoidCallback onTap;

  const MyNotification({super.key,
    required this.Title,
    required this.ImageURl,
    required this.onTap,
    required this.Date
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: Image.network(
                      ImageURl,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(Title,
                              style: TextStyle(
                                color: tColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              maxLines: 2, // Set maximum lines to 2
                              overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                            ),
                          ),
                          Text(
                            Date,
                            style: TextStyle(color: ttColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

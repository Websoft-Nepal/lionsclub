import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Dashboard/focus_program/FocusProgram_Details.dart';
import 'package:lionsclub/main.dart';

class ProgramCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  const ProgramCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FocusProgram_Details(
                    title: title,
                    imageUrl: imageUrl,
                    description: description,
                    date: date)));
      },
      onLongPress: () {},
      child: Container(
        width: 300,
        child: Card(
          surfaceTintColor: Colors.white,
          color: Colors.white,
          elevation: 3.0,
          margin: EdgeInsets.all(15.0),
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
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('Focused Program'),
                      Spacer(),
                      SizedBox(
                        height: 25,
                        width: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FocusProgram_Details(
                                        title: title,
                                        imageUrl: imageUrl,
                                        description: description,
                                        date: date)));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: zColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5), // Adjust padding
                          ),
                          child: Text(
                            'more..',
                            style: TextStyle(
                                fontSize: 10, color: bColor), // Adjust fontSize
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

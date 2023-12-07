import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lionsclub/main.dart';

class MainBoard extends StatefulWidget {
  const MainBoard({super.key});

  @override
  State<MainBoard> createState() => _MainBoardState();
}

class _MainBoardState extends State<MainBoard> {
  final imageUrls = [
    "assets/c1.jpg",
    "https://www.gpo.gov.np/images/uploaded/imagepath/6e597028-8799-4e7f-b115-504eb18305f81f5e9d24-e40b-474e-9bb6-23e53679fbbe74603fbe-dd44-4c7a-9408-0fa1a9b8a027423394eb-53e0-44d3-9dbf-9522ad6067a8gpo.jpg"
    // "https://oag.gov.np/uploads/OAG%2013.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.asset(
                'assets/c1.jpg',
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) {
                // Handle page change
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Focus Program',style: TextStyle(fontSize: 18,fontWeight:FontWeight.bold),),
              Spacer(),
              TextButton(onPressed: () {  },
              child: Text('view more',style: TextStyle(fontSize: 18,color:zColor),))
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 3.0, // Set the elevation for a shadow effect
                  margin: EdgeInsets.all(15.0), // Set margin to provide spacing around the card
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Image at the top
                        Container(
                          width: 250,
                          decoration:BoxDecoration(

                          ) ,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(12)
                              ) ,
                              height: 150,
                              // Set the desired height for the image
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                        child: Image.network('https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/32e6463ba5ff88dc2bbaa026aeec1b62e1c83bdc.jpg',fit: BoxFit.cover,))// Adjust the height of the image as needed

                                  ),
                          ),
                        ),
                        // Text at the bottom
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Child and Women Support Program ',
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
                              Container(
                                height: 25,
                                width: 75,
                                child: Container(

                                    decoration: BoxDecoration(
                                        color: Colors.orange,//->set color btnBg
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    height: 30,
                                    child: Center(child: Text('more')))

                                ,
                              )
                            ],
                          ),
                        )

    ]
                          ),
                  ),
                      ),
              ),
              Container(
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 3.0, // Set the elevation for a shadow effect
                  margin: EdgeInsets.all(15.0), // Set margin to provide spacing around the card
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image at the top
                          Container(
                            width: 250,
                            decoration:BoxDecoration(

                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                ) ,
                                height: 150,
                                // Set the desired height for the image
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network('https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/5ba2874d9fe9b5e8ffdeb6ac76fbc82c2f2c1509.jpg',fit: BoxFit.cover,)),// Adjust the height of the image as needed

                              ),
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Clean Water and Sanitation',
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
                                Container(
                                  height: 25,
                                  width: 75,
                                  child: Container(

                                      decoration: BoxDecoration(
                                          color: Colors.orange,//->set color btnBg
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 30,
                                      child: Center(child: Text('more')))

                                  ,
                                )
                              ],
                            ),
                          )

                        ]
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 3.0, // Set the elevation for a shadow effect
                  margin: EdgeInsets.all(15.0), // Set margin to provide spacing around the card
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image at the top
                          Container(
                            width: 250,
                            decoration:BoxDecoration(

                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                ) ,
                                height: 150,
                                // Set the desired height for the image
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network('https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/9d82a8daf473ef8416c20e59fbf22552d2776e72.jpg',fit: BoxFit.cover,)),// Adjust the height of the image as needed

                              ),
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Good Health and Wel-being',
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
                                Container(
                                  height: 25,
                                  width: 75,
                                  child: Container(

                                      decoration: BoxDecoration(
                                          color: Colors.orange,//->set color btnBg
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 30,
                                      child: Center(child: Text('more')))

                                  ,
                                )
                              ],
                            ),
                          )

                        ]
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 3.0, // Set the elevation for a shadow effect
                  margin: EdgeInsets.all(15.0), // Set margin to provide spacing around the card
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image at the top
                          Container(
                            width: 250,
                            decoration:BoxDecoration(

                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                ) ,
                                height: 150,
                                // Set the desired height for the image
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network('https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/03e44cfa6fb97b578bcdcc0b122adafdabfa728f.jpg',fit: BoxFit.cover,)),// Adjust the height of the image as needed

                              ),
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Environment ',
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
                                Container(
                                  height: 25,
                                  width: 75,
                                  child: Container(

                                      decoration: BoxDecoration(
                                          color: Colors.orange,//->set color btnBg
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 30,
                                      child: Center(child: Text('more')))

                                  ,
                                )
                              ],
                            ),
                          )

                        ]
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 3.0, // Set the elevation for a shadow effect
                  margin: EdgeInsets.all(15.0), // Set margin to provide spacing around the card
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image at the top
                          Container(
                            width: 250,
                            decoration:BoxDecoration(

                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                ) ,
                                height: 150,
                                // Set the desired height for the image
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network('https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/765b7ae19499af570373ebea928f0990bab9cd01.jpg',fit: BoxFit.cover,)),// Adjust the height of the image as needed

                              ),
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Partnership for Goals ',
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
                                Container(
                                  height: 25,
                                  width: 75,
                                  child: Container(

                                      decoration: BoxDecoration(
                                          color: Colors.orange,//->set color btnBg
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 30,
                                      child: Center(child: Text('more')))

                                  ,
                                )
                              ],
                            ),
                          )

                        ]
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: Card(
                  color: Colors.white,
                  elevation: 3.0, // Set the elevation for a shadow effect
                  margin: EdgeInsets.all(15.0), // Set margin to provide spacing around the card
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Image at the top
                          Container(
                            width: 250,
                            decoration:BoxDecoration(

                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(12)
                                ) ,
                                height: 150,
                                // Set the desired height for the image
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.network('https://lionsclubsdistrict325jnepal.org.np/site/uploads/program/fd1e69e74fb947148e94767886e42fd23ca7e138.jpg',fit: BoxFit.cover,)),// Adjust the height of the image as needed

                              ),
                            ),
                          ),
                          // Text at the bottom
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              'Leardership Development Program ',
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
                                Container(
                                  height: 25,
                                  width: 75,
                                  child: Container(

                                      decoration: BoxDecoration(
                                          color: Colors.orange,//->set color btnBg
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      height: 30,
                                      child: Center(child: Text('more')))

                                  ,
                                )
                              ],
                            ),
                          )

                        ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

            ],
          ),
        );
  }
}

import 'package:flutter/material.dart';

class MyCustomClub extends StatelessWidget {
  final String Name;


  MyCustomClub({
    required this.Name,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0,left: 18,top: 8),
      child: Card(
        elevation: 5,
        surfaceTintColor: Colors.white,
        color: Colors.white,
        child: Row(
          children: [
             Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8,left: 8,bottom: 5),
                    child: Text(
                      Name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF141414)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Charter Date ',
                              style: TextStyle(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w800,
                                  color: Color(0xFF141414)),
                            ),
                            SizedBox(height: 5,),
                            Text('2017/01/08',style: TextStyle(fontWeight: FontWeight.w100,color: Color(0xFF666666)),)
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              'Member',
                              style: TextStyle(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w800,
                                  color: Color(0xFF141414)),
                            ),
                            SizedBox(height: 5,),
                            Text('27',style: TextStyle(color: Color(0xFF666666)),)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(flex: 4,),
            Container(height: 80, child: Image.asset('assets/logo.png')),
            Spacer()
          ],
        ),
      ),
    );
  }
}

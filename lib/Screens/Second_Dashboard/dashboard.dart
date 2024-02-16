import 'package:flutter/material.dart';
import 'package:lionsclub/main.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:url_launcher/url_launcher.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SignIn(),
          // ),
          Image.asset('assets/logo_main.png'),
          SizedBox(
            width: 100,
            child: const Divider(
              color: Colors.black26,
              // height: 2,

              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:25.0),
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.contact_mail,
                              color: sColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Contact',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),



                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    )),

                Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.document_scanner,
                              color: sColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Terms and conditions',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),



                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    )),
                Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.lock,
                              color: sColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Privacy',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),



                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    )),
                Container(
                    color: Colors.white,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: sColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'About',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),



                        Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    )),
              ],
            ),
          ),


          Row(
            children: [
              Spacer(),
              SignInButton(Buttons.Facebook,
                  mini: true, onPressed: _launchURLf),
              SignInButton(
                Buttons.Twitter,
                mini: true,
                onPressed: _launchURLt,
              ),
              SignInButton(
                Buttons.LinkedIn,
                mini: true,
                onPressed: _launchURLl,
              ),
              Spacer()
            ],
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  void _launchURLf() async {
    final Uri url = Uri.parse('https://facebook.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void _launchURLt() async {
    final Uri url = Uri.parse('https://x.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }


  void _launchURLl() async {
    final Uri url = Uri.parse('https://linkedin.com');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

}

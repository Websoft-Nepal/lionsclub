import 'package:flutter/material.dart';
import 'package:lionsclub/Screens/Login_Signup%20section/login.dart';
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SignIn(),
          ),
          SizedBox(
            width: 100,
            child: const Divider(
              color: Colors.black26,
              // height: 2,

              thickness: 0.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 0),
            child: Container(
                color: Colors.white,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.contact_mail,
                        color: sColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Contact',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Spacer(
                        flex: 2,
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 10),
            child: Container(
                color: Colors.transparent,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.document_scanner,
                        color: sColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Terms and condition',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 10),
            child: Container(
                // color: Colors.red,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.lock,
                        color: sColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Privacy',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Spacer(
                        flex: 2,
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 10),
            child: Container(
                // color: Colors.red,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        Icons.info,
                        color: sColor,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'About',
                        style: TextStyle(fontSize: 18),
                      ),
                      Spacer(),
                      Spacer(
                        flex: 2,
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                )),
          ),
          Spacer(flex: 2),
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

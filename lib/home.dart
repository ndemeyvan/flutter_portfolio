import 'package:df_app/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _launchURL(String link) async => await canLaunch(link)
      ? await launch(link)
      : throw 'Could not launch $link';

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+237-656209008',
      text: "Hey Yvan! I love your works",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mC,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0),
                AvatarImage(),
                SizedBox(height: 15.0),
                Text(
                  'Ndeme Yvan',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: fCL,
                      size: 18.0,
                    ),
                    SizedBox(width: 1.0),
                    Text(
                      'Douala, Cameroun',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Développeur Mobile et Web',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NMButton(icon: FontAwesomeIcons.desktop, clor: fb),
                    SizedBox(width: 25),
                    NMButton(icon: FontAwesomeIcons.laptopCode, clor: fb),
                    SizedBox(width: 25),
                    NMButton(icon: FontAwesomeIcons.tabletAlt, clor: fb),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    SocialBox(
                      icon: FontAwesomeIcons.vuejs,
                      count: '80%',
                      category: 'Vuejs',
                      color: node,
                    ),
                    SizedBox(width: 15),
                    SocialBox(
                      icon: FontAwesomeIcons.android,
                      count: '90%',
                      category: 'Flutter',
                      color: fb,
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  children: <Widget>[
                    SocialBox(
                      icon: FontAwesomeIcons.html5,
                      count: '94%',
                      category: 'HTML',
                      color: html,
                    ),
                    SizedBox(width: 15),
                    SocialBox(
                      icon: FontAwesomeIcons.css3,
                      count: '90%',
                      category: 'CSS',
                      color: css,
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  children: <Widget>[
                    SocialBox(
                      icon: FontAwesomeIcons.jsSquare,
                      count: '75%',
                      category: 'JavaScript',
                      color: js,
                    ),
                    SizedBox(width: 15),
                    SocialBox(
                      icon: FontAwesomeIcons.nodeJs,
                      count: '70%',
                      category: 'NodeJs',
                      color: node,
                    ),
                  ],
                ),
                SizedBox(height: 14),
              ],
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.09,
            minChildSize: 0.09,
            maxChildSize: 0.4,
            builder: (BuildContext context, scroll) {
              return Container(
                decoration: nMbox,
                child: ListView(
                  controller: scroll,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              FontAwesomeIcons.arrowUp,
                              color: Colors.green,
                              size: 26,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Contact',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Vous pouvez me contacter via ',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 225,
                            padding: EdgeInsets.all(10),
                            decoration: nMboxInvert,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                    onTap: () {
                                      _launchURL(
                                          "https://www.linkedin.com/in/ndeme-yvan-127a981a7/");
                                    },
                                    child: Icon(FontAwesomeIcons.linkedin,
                                        color: css)),
                                GestureDetector(
                                    onTap: () {
                                      _launchURL(
                                          "https://twitter.com/ndemeYvan");
                                    },
                                    child: Icon(FontAwesomeIcons.twitter,
                                        color: tw)),
                                GestureDetector(
                                    onTap: () {
                                      launchWhatsApp();
                                    },
                                    child: Icon(FontAwesomeIcons.whatsapp,
                                        color: what)),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Je suis pasionné du code.',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '#ndemeYvan',
                            style: TextStyle(
                              color: css,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class SocialBox extends StatelessWidget {
  final IconData icon;
  final String count;
  final String category;
  final Color color;

  const SocialBox({this.icon, this.count, this.category, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: nMboxInvert,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FaIcon(icon, color: color, size: 20),
            SizedBox(width: 8),
            Text(
              category,
            ),
            SizedBox(width: 3),
            Text(
              count,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class NMButton extends StatelessWidget {
  final IconData icon;
  final Color clor;

  const NMButton({this.icon, this.clor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: nMbox,
      child: Icon(
        icon,
        color: clor,
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8),
      decoration: nMbox,
      child: Container(
        decoration: nMbox,
        padding: EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/img/freddy.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}

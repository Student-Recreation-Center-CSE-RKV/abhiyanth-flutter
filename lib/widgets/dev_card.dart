import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}

class DevCard extends StatelessWidget {
  final Map<String, dynamic> dev;

  DevCard({required this.dev});

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List<Map<String, dynamic>> socialIcons = [];

    dev["socials"]?.forEach((key, value) {
      IconData icon;
      switch (key) {
        case "github":
          icon = FontAwesomeIcons.github;
          break;
        case "linkedin":
          icon = FontAwesomeIcons.linkedin;
          break;
        case "instagram":
          icon = FontAwesomeIcons.instagram;
          break;
        default:
          icon = Icons.link;
      }
      socialIcons.add({"icon": icon, "url": value});
    });

    return Container(
      margin: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFFF6AB7).withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(-5, -5),
          ),
          BoxShadow(
            color: Color(0xFF6AE4FF).withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 3)),
        child: Container(
          // width: SizeConfig.blockSizeHorizontal * 44, // Responsive width
          // height: SizeConfig.blockSizeVertical * 25, // Adjusted height
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Added alignment
            children: [
              // Dev Profile Image
              CircleAvatar(
                backgroundImage: NetworkImage(dev["image"]),
                radius: SizeConfig.blockSizeHorizontal *
                    14, // Responsive image size
              ),
              SizedBox(height: SizeConfig.blockSizeVertical * 1.5),

              // Dev Name
              Text(
                dev["name"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal *
                        4, // Responsive font size
                    fontWeight: FontWeight.bold),
              ),

              // Social Media Icons (Auto-adjust based on count)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: SizeConfig.blockSizeHorizontal * 0,
                children: socialIcons.map<Widget>((social) {
                  return IconButton(
                    icon: FaIcon(
                      social["icon"],
                      color: Colors.white,
                      size: SizeConfig.blockSizeHorizontal *
                          4, // Adjust for 3 socials
                    ),
                    onPressed: () => _launchURL(social["url"]),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

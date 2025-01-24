import 'package:abhiyanth/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';

class EventCard extends StatelessWidget {
  final String date;
  final String title;
  final String location;
  final String imageUrl;

  const EventCard({
    super.key,
    required this.date,
    required this.title,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Container(
      height: SizeConfig.blockSizeVertical * 21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.blockSizeHorizontal * 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: SizeConfig.blockSizeHorizontal * 2,
            offset: Offset(0, SizeConfig.blockSizeVertical * 0.5),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 3),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal * 3),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.transparent,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal * 3),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.2),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.white70,
                    fontFamily: "Audiowide",
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.blockSizeHorizontal * 5.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Audiowide",
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 0.5),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.white54,
                    fontFamily: "Audiowide",
                    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 1),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(eventTitle: title),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFFF3366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 2.5),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 0.7,
                      horizontal: SizeConfig.blockSizeHorizontal * 1.75,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the row takes only as much space as needed
                    children: [
                      Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                        ),
                      ),
                      SizedBox(
                          width: SizeConfig.blockSizeHorizontal *
                              1), // Optional spacing between text and icon
                      Icon(
                        Icons.arrow_outward_outlined,
                        size: SizeConfig.blockSizeHorizontal *5, // Adjust icon size if needed
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

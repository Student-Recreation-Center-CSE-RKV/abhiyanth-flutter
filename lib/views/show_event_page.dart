import 'package:url_launcher/url_launcher.dart';
import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/views/solo_event_registartion_page.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class ShowEventPage extends StatelessWidget {
  const ShowEventPage({super.key, required this.event});
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            leadingWidth: 60,
            backgroundColor: Colors.transparent,
            title: const Text(
              "Abhiyanth 2K25",
              style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                  child: BorderGradient(
                    borderWidth: 6.0,
                    gradientColors: const [
                      Color(0xFFFF6AB7),
                      Color(0xFF6AE4FF)
                    ],
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 5),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockHorizontal * 15,
                          vertical: SizeConfig.safeBlockVertical * 1.5),
                      child: Text(
                        event.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Audiowide",
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
                  height: SizeConfig.screenHeight * 0.28,
                  width: SizeConfig.screenWidth * 0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          event.image), // Use NetworkImage for online images
                      fit: BoxFit.cover, // Adjusts how the image fits
                    ),
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
                  child: BorderGradient(
                    borderWidth: 6.0,
                    gradientColors: const [
                      Color(0xFFFF6AB7),
                      Color(0xFF6AE4FF)
                    ],
                    borderRadius: BorderRadius.circular(
                        SizeConfig.safeBlockHorizontal * 5),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.calendar_month_rounded,
                            size: 30,
                            color: Colors.lightBlueAccent,
                          ),
                          title: Text(
                            "${event.date.day}-${event.date.month}-${event.date.year}",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Audiowide",
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.watch_later_outlined,
                            size: 30,
                            color: Colors.lightBlueAccent,
                          ),
                          title: Text(
                            '${event.date.hour % 12}:${event.date.minute.toString().padLeft(2, '0')} ${event.date.hour < 12 ? 'AM' : 'PM'}',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Audiowide",
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.lightBlueAccent,
                          ),
                          title: Text(
                            event.venue,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Audiowide",
                              fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal * 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              event.description,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Audiowide",
                                fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1,
                        ),
                        event.prizes.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.safeBlockHorizontal * 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Prizes :",
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 25,
                                      fontFamily: "Audiowide",
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        ...event.prizes.map((prize) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 7),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.lightBlueAccent,
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 2,
                                ),
                                Text(
                                  '$prize',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Audiowide",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1,
                        ),
                        event.result.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.safeBlockHorizontal * 5),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      "Winners :",
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 25,
                                        fontFamily: "Audiowide",
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.start,
                                    )),
                              )
                            : SizedBox(),
                        ...event.result.map((prize) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 7),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.lightBlueAccent,
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 2,
                                ),
                                Text(
                                  '$prize',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Audiowide",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 1,
                        ),
                        event.sponsors.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.safeBlockHorizontal * 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    "Sponsors :",
                                    style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 25,
                                      fontFamily: "Audiowide",
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        ...event.sponsors.map((prize) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 7),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.lightBlueAccent,
                                ),
                                SizedBox(
                                  width: SizeConfig.safeBlockHorizontal * 2,
                                ),
                                Text(
                                  '$prize',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Audiowide",
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
                        ),
                        TextButton(
                          onPressed: () async {
                            if (event.registration_link.isNotEmpty) {
                              Uri uri = Uri.parse(event.registration_link);
                              await launchUrl(uri,
                                  mode: LaunchMode.externalApplication);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SoloEventRegistartionPage(
                                          event: event,
                                        )),
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFFFF3366),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.blockSizeHorizontal * 2.5),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical * 1,
                              horizontal: SizeConfig.blockSizeHorizontal * 5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Ensures the row takes only as much space as needed
                            children: [
                              Text(
                                "Register Now",
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4,
                                  fontFamily: "Audiowide",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 2,
                        ),
                      ],
                    ),
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

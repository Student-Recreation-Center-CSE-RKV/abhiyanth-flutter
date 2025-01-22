
import 'package:flutter/material.dart';

// import 'package:url_launcher/url_launcher.dart';

class MeetTheTeamWidget extends StatelessWidget {

  const MeetTheTeamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
            border: Border.all(
              color: Colors.pinkAccent
                  .withOpacity(0.6), // Border with gradient effect
              width: 2,
            )),
        child: Column(
          children: [
            const SizedBox(height: 10),
            // Title Text
            const Text(
              "Brains Behind the Bytes",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Audiowide",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image (GIF)
                // Image.asset(
                //   'assets/images/robot.gif',
                //   height: 150,
                // ),
                SizedBox(width: 10),
                // Description Text
                Expanded(
                  child: Text(
                    "This application is more than just lines of code it's a product of creativity, passion, and teamwork. Every touch and scroll reflects the dedication of a talented development team who worked tirelessly to bring our vision to life.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Audiowide",
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 30),
            // Call-to-action Text
            const Text(
              "Curious to meet the minds behind this digital masterpiece?",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "Audiowide",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: () async {
                // const upiUrl =
                //     'https://abhiyanthrkv.in/ourTeam/';
                // if (await canLaunchUrl(Uri.parse(upiUrl))) {
                //   await launchUrl(Uri.parse(upiUrl));
                // } else {
                //   throw 'Could not launch $upiUrl';
                // }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border(
                    left: BorderSide(
                      color: Colors.pinkAccent
                          .withOpacity(0.6),
                      width: 2,
                    ),
                    top: BorderSide(
                      color: Colors.pinkAccent
                          .withOpacity(0.6), // Border with gradient effect
                      width: 2,
                    ),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF261E35),
                      Colors.black,
                      Color(0xFF261E35),
                    ], // Gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    "Meet the team",
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 22,
                      fontFamily: "Audiowide",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10), // Spacer to separate content
          ],
        ),
      ),
    );
  }
}

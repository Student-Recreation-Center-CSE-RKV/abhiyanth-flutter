import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/widgets/meet_the_team_widget.dart';
import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'auditions_page.dart';
import 'culturals_page.dart';
import 'stalls_page.dart';
import 'workshops_page.dart';
// import 'technicals_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

final List<Map<String, String>> items = [
  // {"title": "Workshops", "image": "https://i.pinimg.com/736x/14/4d/f7/144df7aa7380e378ec3edc6cc819d9d8.jpg", "page": 'workshops'},
  {"title": "Culturals", "image": "https://i.pinimg.com/originals/28/0a/a8/280aa85f2f5a8a8d145b6477d69afeed.gif", "page": 'culturals'},
  {"title": "Auditions", "image": "https://i.pinimg.com/736x/90/b2/26/90b22654bdd3b47ee3cfea2ac729ed00.jpg", "page": 'auditions'},
  {"title": "Stalls", "image": "https://i.pinimg.com/736x/06/5f/97/065f97bf7a68e9f3e4923450624d122c.jpg", "page": 'stalls'},
  // {"title": "Technical", "image": "https://i.pinimg.com/236x/28/e0/ee/28e0ee60a69aed737f9c258a5b23b9ab.jpg", "page": 'technical'},
];

final List<Map<String, String>> sliderItems = [
  {'image': 'https://i.pinimg.com/originals/2d/02/f5/2d02f519b70b86ef83f307260886d611.gif', 'text': 'New Year'},
  {'image': 'https://i.pinimg.com/736x/cc/3a/58/cc3a582a151ae4b62e4739977687601c.jpg', 'text': 'Bhai'},
  {'image': 'https://i.pinimg.com/originals/ba/9c/97/ba9c974edabed08eaf383adee8c100a1.gif', 'text': 'Unnamed'},
];

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig

    // Dynamic sizes using SizeConfig
    NavigationService navigationService=NavigationService();
    double avatarRadius = SizeConfig.safeBlockHorizontal * 10;
    double spacing = SizeConfig.safeBlockVertical * 2;
    double textFontSize = SizeConfig.safeBlockHorizontal * 3;

    void navigateToPage(String page) {
      // Perform navigation based on the page name
      switch (page) {
        case 'Workshops':
         navigationService.pushScreen(RoutesName.workshop);
          break;
        case 'Culturals':
         navigationService.pushScreen(RoutesName.culturals);
          break;
        case 'Auditions':
          navigationService.pushScreen(RoutesName.auditions);
          break;
        case 'Stalls':
         navigationService.pushScreen(RoutesName.stalls);
          break;
        case 'Technical':
          navigationService.pushScreen(RoutesName.technical);
          break;
        default:
          break;
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent, // Background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Dashboard header

            ImageSliderWidget(items: sliderItems),
            const SizedBox(height: 20),
            // Circular buttons
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 1, // Ensures items are square
              ),
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4), // 4% padding
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate when an item is tapped
                    navigateToPage(items[index]['title']!);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage: NetworkImage(items[index]["image"]!),
                      ),
                      SizedBox(height: spacing / 2), // Adjust spacing
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: textFontSize,
                          fontFamily: "Audiowide",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const MeetTheTeamWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/widgets/coming_soon.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/services/home_carousal.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final EventService eventService = EventService(); // Event service instance
  List<Map<String, String>> items = [];
  List<Map<String, String>> sliderItems = [];

  @override
  void initState() {
    super.initState();
    fetchDynamicData(); // Fetch dynamic data on initialization
  }

  Future<void> fetchDynamicData() async {
    try {
      // Fetch events for the slider
      final events = await eventService.getEvents();
      setState(() {
        sliderItems = events.map((event) {
          return {
            'image': event['image'] ?? '',
            'text': event['title'] ?? '',
          };
        }).toList();
      });

      // Set hardcoded items (can also fetch dynamically if needed)
      setState(() {
        items = [
          {
            "title": "Culturals",
            "image":
                "https://i.pinimg.com/originals/28/0a/a8/280aa85f2f5a8a8d145b6477d69afeed.gif",
            "page": 'culturals'
          },
          {
            "title": "Auditions",
            "image":
                "https://i.pinimg.com/736x/90/b2/26/90b22654bdd3b47ee3cfea2ac729ed00.jpg",
            "page": 'auditions'
          },
          {
            "title": "Stalls",
            "image":
                "https://i.pinimg.com/736x/06/5f/97/065f97bf7a68e9f3e4923450624d122c.jpg",
            "page": 'stalls'
          },
        ];
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  void navigateToPage(String page) {
    NavigationService navigationService = NavigationService();
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

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig
    double avatarRadius = SizeConfig.safeBlockHorizontal * 10;
    double spacing = SizeConfig.safeBlockVertical * 2;
    double textFontSize = SizeConfig.safeBlockHorizontal * 3;

    return Scaffold(
      backgroundColor: Colors.transparent, // Background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Image Slider
            sliderItems.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ImageSliderWidget(items: sliderItems),
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
              padding: EdgeInsets.all(
                  SizeConfig.safeBlockHorizontal * 4), // 4% padding
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
            const SizedBox(height: 120),
            // Coming Soon Widget
            ComingSoonWidget(
              text: "Time remaining Abhiyanth 2K25",
              backgroundColor: Colors.transparent,
              // targetDate: ,
            ),
          ],
        ),
      ),
    );
  }
}

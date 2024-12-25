import 'package:flutter/material.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/gradient_icon.dart';
import 'package:abhiyanth/widgets/gradient_text.dart';
import 'package:abhiyanth/views/landing_page.dart';
import 'package:abhiyanth/views/departments_page.dart';
import 'package:abhiyanth/views/event_page.dart';
import 'package:abhiyanth/views/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
  // Widget _buildNavItem(IconData icon, String label) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       GradientIcon(icon: icon, size: 28),
  //       GradientText(text: label, size: 12),
  //     ],
  //   );
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onBottomNavTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final navigationViewModel = NavigationViewModel();

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          leadingWidth: 60,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth 2K25",
            style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ))
          ],
          centerTitle: true,
          elevation: 0,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            LandingPage(),
            EventPage(),
            DepartmentsPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: _currentPage,
          height: 55,
          animationDuration: Duration(milliseconds: 400),
          color:LinearGradient(
            colors: [
              Color(0xFF261E35),
              Colors.black,
              Colors.black,
              Colors.black, // Third black (extra stop)
              Color(0xFF261E35), // Side color
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.005, 0.4, 0.5, 0.6, 0.995],
          ),
          backgroundColor: Colors.white60,
          buttonBackgroundColor: Colors.black,
          items: <Widget>[
            GradientIcon(
              icon: Icons.home,
              size: 30,
            ),
            GradientIcon(
              icon: Icons.event,
              size: 30,
            ),
            GradientIcon(
              icon: Icons.apartment_outlined,
              size: 30,
            ),
            GradientIcon(
              icon: Icons.person,
              size: 30,
            ),
          ],
          onTap: _onBottomNavTapped,
        ),
        // bottomNavigationBar: FlashyTabBar(
        //   height: 48,
        //   backgroundColor: Colors.black,
        //   animationCurve: Curves.linear,
        //   selectedIndex: _currentPage,
        //   iconSize: 25,
        //   animationDuration: Duration(milliseconds: 500),
        //   showElevation: false,
        //   onItemSelected: (index) => setState(() {
        //     _currentPage = index;
        //   }),
        //   items: [
        //     FlashyTabBarItem(
        //       icon:GradientIcon(icon: Icons.home),
        //       title: GradientText(text: "home",size: 15,),
        //       activeColor: LinearGradient(
        //         colors: [
        //           Color(0xFF261E35), // Side color
        //           Colors.black, // Center color
        //           Colors.black, // Second black (extra stop)
        //           Colors.black, // Third black (extra stop)
        //           Color(0xFF261E35), // Side color
        //         ],
        //         begin: Alignment.centerLeft,
        //         end: Alignment.centerRight,
        //         stops: [0.005, 0.4, 0.5, 0.6, 0.995],
        //       ),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(Icons.calendar_month_outlined),
        //       title: Text('Events'),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(Icons.apartment_outlined),
        //       title: Text('Department',style: TextStyle(fontSize: 11),),
        //     ),
        //     FlashyTabBarItem(
        //       icon: Icon(Icons.person),
        //       title: Text('Profile'),
        //     ),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     print('Home Button Pressed');
        //   },
        //   tooltip: 'Home',
        //   child: const Icon(Icons.home),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

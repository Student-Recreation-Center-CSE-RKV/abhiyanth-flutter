import 'package:flutter/material.dart';
// import 'package:abhiyanth/view_model/navigation_view_model.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/gradient_icon.dart';
import 'package:abhiyanth/widgets/gradient_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientIcon(icon: icon, size: 28),
        GradientText(text: label, size: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final navigationViewModel = NavigationViewModel();

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Home Page",
            style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: const Center(
          child: Text(
            'Welcome to the Home Page!',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: "Audiowide"),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.white, width: 1),
            ),
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            shape: const CircularNotchedRectangle(),
            child: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 'Home'),
                  _buildNavItem(Icons.event, 'Events'),
                  const SizedBox(width: 40), // Space for the center button
                  _buildNavItem(Icons.map, 'Map'),
                  _buildNavItem(Icons.person, 'Profile'),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Home Button Pressed');
          },
          tooltip: 'Home',
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

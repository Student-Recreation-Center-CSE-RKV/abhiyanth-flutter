import 'package:abhiyanth/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


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
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        leadingWidth: 50,
        title: Text("Abhiyanth"),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
              onPressed: (){},
              icon: Icon(Icons.notifications)
          )
        ],

      ),
      drawer: Drawer(
        backgroundColor:Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RGUKT',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Mess Management System',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => ()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.feedback_outlined,
                      size: 35,
                      color:Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Feedback',
                      // style: TextStyle(fontWeight: FontWeight.bold,color: ThemeService.secondaryColor),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => SubmitComplaintPage()));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.report_gmailerrorred,
                      size: 35,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Complaints',
                      // style: TextStyle(fontWeight: FontWeight.bold,color: ThemeService.secondaryColor),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          // MessMenuPage(),
          // NoticeBoard(),
          // CommonIssues(),
          // ProfilePage(),
        ],
      ),
      bottomNavigationBar: FlashyTabBar(
        height: 48,
        animationCurve: Curves.linear,
        selectedIndex: _currentPage,
        iconSize: 25,
        animationDuration: Duration(milliseconds: 500),
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _currentPage = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            title: Text('Events'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.apartment_outlined),
            title: Text('Department',style: TextStyle(fontSize: 11),),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/views/components/favorite_page.dart';
import 'package:quotes_app/views/components/setting_page.dart';

import '../components/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();

  int maxCount = 3;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    HomeScreen(),
    FavoritePage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          //physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: // (bottomBarPages.length <= maxCount)
            AnimatedNotchBottomBar(
          /// Provide NotchBottomBarController
          notchBottomBarController: notchBottomBarController,
          color: Colors.white,
          showLabel: true,
          //notchColor: Colors.black87,

          /// restart app if you change removeMargins
          removeMargins: false,
          bottomBarWidth: 500,
          durationInMilliSeconds: 300,
          bottomBarItems: [
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.home_filled,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.home_filled,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Home',
            ),
            const BottomBarItem(
              inActiveItem: Icon(
                Icons.favorite_outline,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.favorite_outline,
                color: Colors.blueAccent,
              ),
              itemLabel: 'Favorite',
            ),

            ///svg example
            BottomBarItem(
              inActiveItem: Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
              activeItem: Icon(
                Icons.settings,
                color: Colors.blueAccent,
              ),
              itemLabel: ''
                  'Setting',
            ),
          ],
          onTap: (index) {
            /// perform action on tab change and to update pages you can update pages without pages
            pageController.jumpToPage(index);
          },
        )
        //: null,
        );
  }
}
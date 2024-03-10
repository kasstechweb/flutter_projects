import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:widgets/pages/curved_nav_pages/curved_fav.dart';
import 'package:widgets/pages/curved_nav_pages/curved_home.dart';
import 'package:widgets/pages/curved_nav_pages/curved_profile.dart';
import 'package:widgets/pages/curved_nav_pages/curved_search.dart';
import 'package:widgets/pages/curved_nav_pages/curved_settings.dart';

class MyCurvedNavigationBar extends StatefulWidget {
  const MyCurvedNavigationBar({super.key});

  @override
  State<MyCurvedNavigationBar> createState() => _MyCurvedNavigationBarState();
}

class _MyCurvedNavigationBarState extends State<MyCurvedNavigationBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;

  final Screens = [
    CurvedHome(),
    CurvedSearch(),
    CurvedFavourite(),
    CurvedSettings(),
    CurvedProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30),
    ];
    return Container(
      color: Colors.blue,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: const Text('Curved Navigation Bar'),
              centerTitle: true,
            ),
            body: Screens[index],
            // SafeArea(
            //   child: Center(
            //     child: Column(
            //       children: [
            //         Text(
            //           '$index',
            //           style: const TextStyle(
            //             color: Colors.white,
            //             fontSize: 120,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         const SizedBox(height: 16),
            //         ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             foregroundColor: Colors.black,
            //             backgroundColor: Colors.white,
            //             minimumSize: Size(250, 56),
            //           ),
            //           onPressed: () {
            //             final navigationState = navigationKey.currentState!;
            //             navigationState.setPage(0);
            //           },
            //           child: Text('Go to 0', style: TextStyle(fontSize: 32)),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                color: Colors.blue,
                buttonBackgroundColor: Colors.purple,
                backgroundColor: Colors.transparent,
                height: 60,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 300),
                index: index,
                items: items,
                onTap: (index) => setState(() => this.index = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

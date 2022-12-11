import 'package:flutter/material.dart';
import 'package:rapid/otherpages/payment.dart';
import 'package:rapid/search_page.dart';
//import 'package:rapid/utils/consts.dart';
import 'package:rapid/search_page.dart';
import 'package:rapid/card.dart';
import 'package:rapid/profile.dart';
import 'package:rapid/trips.dart';

late int idx;

class page_controller extends StatefulWidget {
  page_controller(int a) {
    idx = a;
  }
  @override
  _page_controllerState createState() => _page_controllerState();
}

class _page_controllerState extends State<page_controller> {
  PageController _pageController = PageController(initialPage: idx);
  int bottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          search_page(), trips(), card(), profile(),
          //payment()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
            )
          ],
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 118, 128, 243),
          unselectedItemColor: Colors.grey,
          currentIndex: bottomNavigationIndex,
          onTap: (index) {
            setState(() {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 400),
                curve: Curves.decelerate,
              );
              bottomNavigationIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Search', icon: Icon(Icons.search_rounded)),
            BottomNavigationBarItem(
                label: 'Trips', icon: Icon(Icons.directions_bus_filled)),
            BottomNavigationBarItem(
                label: 'Card', icon: Icon(Icons.credit_card)),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.supervised_user_circle_sharp),
            ),
            // BottomNavigationBarItem(
            //     label: 'payment', icon: Icon(Icons.payment)),
          ],
        ),
      ),
    );
  }
}

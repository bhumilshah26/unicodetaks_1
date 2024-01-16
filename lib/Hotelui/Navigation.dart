import 'package:flutter/material.dart';
import 'package:hotbook/Hotelui/profile.dart';

import 'Colors.dart';

class navigationBar extends StatelessWidget {
  int _currentIndex = 0;
  Constants myconstants = Constants();
  int count = 0;
  navigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(
              Icons.search,
              size: 25,
              color: myconstants.secondaryColor,
            ),
          ),

          BottomNavigationBarItem(
            label: 'Bookings',
            icon: Icon(Icons.star_border,
              size: 25,
              color: myconstants.secondaryColor,
            ),
          ),BottomNavigationBarItem(
            label: 'Favourites',
            icon: Icon(Icons.favorite_border,
              size: 25,
              color: myconstants.secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            backgroundColor: myconstants.secondaryColor,
            icon: Icon(
              Icons.account_circle_sharp,
              color: myconstants.secondaryColor,
              size: 25,
            ),
          ),
        ],
        onTap: (index) {
          _currentIndex = index;

          //   if (_currentIndex == 0) {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => const Homepage()));
          //   }
          //   if (_currentIndex == 1) {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => const contactdata()));
           //   }
          //   if (_currentIndex == 2) {
          //     if (count == 0) {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const Welcome()));
          //       count++;
          //     } else {}
          //   }
            if (_currentIndex == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Profile()));
            }
          // }
        });
  }
}
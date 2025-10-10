import 'package:ecommerce_chat/pages/home/chat_page.dart';
import 'package:ecommerce_chat/pages/home/home_page.dart';
import 'package:ecommerce_chat/pages/home/profile_page.dart';
import 'package:ecommerce_chat/pages/home/wishlist_page.dart';
import 'package:ecommerce_chat/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget cartButton() {
    return FloatingActionButton(
      onPressed: () {},
      shape: const CircleBorder(),
      backgroundColor: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Image.asset('assets/icon_cart.png', width: 30),
      ),
    );
  }

  Widget customBottomNav() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAlias,
        color: backgroundColor4,
        padding: const EdgeInsets.only(bottom: 4),
        child: BottomNavigationBar(
          backgroundColor: backgroundColor4,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_home.png',
                width: 21,
                color: currentIndex == 0
                    ? primaryColor
                    : const Color(0xff808191),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_chat.png',
                width: 21,
                color: currentIndex == 1
                    ? primaryColor
                    : const Color(0xff808191),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_wishlist.png',
                width: 21,
                color: currentIndex == 2
                    ? primaryColor
                    : const Color(0xff808191),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_profile.png',
                width: 21,
                color: currentIndex == 3
                    ? primaryColor
                    : const Color(0xff808191),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return ChatPage();
      case 2:
        return WishlistPage();
      case 3:
        return ProfilePage();
      default:
        return HomePage(); // Return an empty widget as a fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:while_app/theme/pallete.dart';
import 'package:while_app/view/create_screen.dart';
import 'package:while_app/view/feed_screen.dart';
import 'package:while_app/view/profile/user_profile_screen.dart';
import 'package:while_app/view/reels_screen.dart';
import 'package:while_app/view/social/social_home_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _screens = [
    const FeedScreen(),
    const CreateScreen(),
    const ReelsScreen(),
    const SocialScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 50,
        // shape: const CircularNotchedRectangle(),
        color: currentTheme.primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {
                _onTabTapped(0);
              },
              icon: const Icon(Icons.home, size: 30),
            ),
            IconButton(
              onPressed: () {
                _onTabTapped(1);
              },
              icon: const Icon(Icons.movie_creation_outlined, size: 30),
            ),
            IconButton(
                iconSize: 65,
                onPressed: () {
                  _onTabTapped(2);
                },
                icon: Image.asset(
                  'assets/whilelogowithoutname.png',
                  fit: BoxFit.fill,
                )),
            IconButton(
              onPressed: () {
                _onTabTapped(3);
              },
              icon: const Icon(Icons.message, size: 30),
            ),
            IconButton(
              onPressed: () {
                _onTabTapped(4);
              },
              icon: const Icon(Icons.account_circle, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

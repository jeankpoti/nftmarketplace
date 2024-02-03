import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'constants/app_colors.dart';
import 'screens/favorite_sccreen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  ScrollController _scrollController = ScrollController();
  bool _showPersistentTabView = true;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      print('scrolling');
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _showPersistentTabView = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showPersistentTabView = true;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.idle) {
        print('idle');
        setState(() {
          _showPersistentTabView = true;
        });
      }
    });
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(scrollController: _scrollController),
      const FavoriteScreen(),
      const SettingScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: 20.sp,
        ),
        title: ("Home"),
        activeColorPrimary: AppColors.accent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.favorite_border_outlined,
          size: 20.sp,
        ),
        title: ("favorite"),
        activeColorPrimary: AppColors.accent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.settings_outlined,
          size: 20.sp,
        ),
        title: ("Setting"),
        activeColorPrimary: AppColors.accent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person_outline_outlined,
          size: 20.sp,
        ),
        title: ("Profile"),
        activeColorPrimary: AppColors.accent,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return
        //  _showPersistentTabView
        //     ?
        PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.primary, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
    // : HomeScreen(scrollController: _scrollController);
  }
}

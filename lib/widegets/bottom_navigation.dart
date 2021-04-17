import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cycle/layouts/base_layout.dart';
import 'package:flutter_cycle/pages/chat/chat.dart';
import 'package:flutter_cycle/pages/create_widget_to_json_demo/create_widget_to_json_demo.dart';
import 'package:flutter_cycle/pages/default_demo/default_demo.dart';
import 'package:flutter_cycle/pages/http_demo/http_demo.dart';
import 'package:flutter_cycle/pages/lifestyle/lifestyle.dart';
import 'package:flutter_cycle/pages/otp/otp.dart';
import 'package:flutter_cycle/pages/push_demo/push_demo.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';


class BottomNavigation extends BaseLayoyt {
  @override
  _BottomNavigationState getState() => _BottomNavigationState();
}

class _BottomNavigationState extends BaseLayoytState<BottomNavigation> {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  Widget getPresistentTabView() {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.black,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [DefaultDemo(), Chat(), OtpDemo(), LifeStyle(), PushDemo()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_alt),
        title: ("Contancts"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.chat_bubble_text),
        title: ("Chats"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.camera_viewfinder),
        title: ("SID9"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.rectangle_stack_person_crop_fill),
        title: ("LifeStyle"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.settings),
        title: ("iOffice"),
      ),
    ];
  }

  @override
  Widget CreatePageView() {
    return getPresistentTabView();
  }
}

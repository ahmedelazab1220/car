import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomNavBar extends StatefulWidget {
  final void Function()? onPressed;
  final List<PersistentBottomNavBarItem> items;
  final List<Widget> screens;
  const CustomNavBar(
      {super.key, this.onPressed, required this.items, required this.screens});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  PersistentTabController controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        navBarHeight: 70,
        controller: controller,
        context,
        hideNavigationBarWhenKeyboardAppears: true,
        // resizeToAvoidBottomInset: true,
        // padding: const EdgeInsets.symmetric(vertical: 10),
        screens: widget.screens,
        items: widget.items,
        navBarStyle: NavBarStyle.style7,
      ),
    );
  }
}

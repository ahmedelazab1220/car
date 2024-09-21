import 'package:car_help/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Tabbar2 extends StatefulWidget {
  const Tabbar2({
    Key? key,
    required this.views,
    required this.tabs,
    this.isScrollable = true,
  }) : super(key: key);
  final List<Widget> tabs, views;
  final bool isScrollable;
  @override
  State<Tabbar2> createState() => _Tabbar2State();
}

class _Tabbar2State extends State<Tabbar2> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: widget.tabs.length, vsync: this);
    controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            indicatorColor: AppColors.primary,
            dividerColor: AppColors.black,
            controller: controller,
            labelStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Cairo',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.black,
            isScrollable: widget.isScrollable,
            tabs: widget.tabs),
        Expanded(
          child: SizedBox(
              width: double.maxFinite,
              child:
                  TabBarView(controller: controller, children: widget.views)),
        ),
      ],
    );
  }
}

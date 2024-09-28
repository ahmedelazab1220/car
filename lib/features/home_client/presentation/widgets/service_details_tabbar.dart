import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_details_view_body.dart';
import 'package:flutter/material.dart';

class ServiceDetailsTabbar extends StatefulWidget {
  const ServiceDetailsTabbar({
    super.key,
    required this.views,
    required this.tabs,
  });
  final List<Widget> tabs, views;
  @override
  State<ServiceDetailsTabbar> createState() => _ServiceDetailsTabbarState();
}

class _ServiceDetailsTabbarState extends State<ServiceDetailsTabbar>
    with TickerProviderStateMixin {
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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
                // child: CustomSearch(),
                ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppColors.grey)),
                      child: TabBar(
                          dividerColor: Colors.transparent,
                          controller: controller,
                          indicatorPadding: const EdgeInsets.all(5),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(30)),
                          labelStyle: AppStyles.textStyle12_900
                              .copyWith(fontFamily: 'Cairo'),
                          labelColor: AppColors.black,
                          unselectedLabelColor: AppColors.black,
                          // isScrollable: true,
                          tabs: widget.tabs),
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: SizedBox(
          width: double.maxFinite,
          child: TabBarView(
            controller: controller,
            children: widget.views,
          ),
        ),
      ),
    );
  }
}

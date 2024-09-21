import 'package:car_help/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({super.key});

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: CupertinoSearchTextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    borderRadius: BorderRadius.circular(10),
                    backgroundColor: Colors.white,
                    style: TextStyle(
                      color: AppColors.scendary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      // Call your search function here
                      // cubit.search(value);
                    },
                  ),
                ),
              ),
              // CircleButton(
              //   icon: Icons.tune,
              //   onPressed: () {},
              // )
            ],
          ),
        ),
        // Expanded(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 6),
        //     child: ListView.builder(
        //       itemCount: 5,
        //       itemBuilder: (context, index) {
        //         return Column(
        //           children: [
        //             ServiceProvidersCard(
        //               onTap: () => AppConstant.navigateTo(
        //                 context,
        //                 const ServiceDetailsView(),
        //               ),
        //             ),
        //           ],
        //         );
        //       },
        //     ),
        //   ),
        // )
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }
}

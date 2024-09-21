import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ServicesHomeLoadingView extends StatelessWidget {
  const ServicesHomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white12,
              child: Container(
                height: 85,
                width: 85,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
    );
  }
}

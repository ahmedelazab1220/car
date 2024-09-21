import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';

class ServiceDetailsImagesWidget extends StatelessWidget {
  final ProviderEntity data;

  const ServiceDetailsImagesWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.bodyHeight * 0.25,
        ),
        Center(
          child: Container(
            width: SizeConfig.screenWidth * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: data.gallery?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final imageUrl = data.gallery?[index] ?? '';
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: CustomNetworkImage(
                      height: 70,
                      width: 70,
                      radius: 8,
                      imageUrl: imageUrl,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

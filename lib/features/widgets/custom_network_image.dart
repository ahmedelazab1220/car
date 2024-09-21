// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double width, height, radius;
  final BorderRadiusGeometry? borderRadius;
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.width = 80,
    this.height = 80,
    this.radius = 50,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.cover,
        imageUrl: imageUrl ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRao_0xQcdcOVK9S6UuSGjkQGy4j2uPsZ0Uug&usqp=CAU',
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

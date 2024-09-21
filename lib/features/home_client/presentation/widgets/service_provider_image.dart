import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ServiceProvidersImage extends StatelessWidget {
  const ServiceProvidersImage({
    super.key,
    required this.imageUrl,
  });
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: (Localizations.localeOf(context).languageCode == 'en')
          ? const BorderRadius.only(
              bottomLeft: Radius.circular(8), topLeft: Radius.circular(8))
          : const BorderRadius.only(
              bottomRight: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width * 0.30,
        height: double.maxFinite,
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

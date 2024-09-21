import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_provider_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceProvidersListView extends StatelessWidget {
  final List<ProviderEntity> providers;
  const ServiceProvidersListView({super.key, required this.providers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: providers.length,
        itemBuilder: (context, index) {
          return ServiceProvidersCard(
            data: providers[index],
            onTap: () => GoRouter.of(context)
                .push(AppRouter.kServiceDetailsView, extra: providers[index]),
          );
        },
      ),
    );
  }
}

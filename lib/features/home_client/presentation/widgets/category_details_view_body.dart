import 'package:car_help/config/function/app_router.dart';
import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/categories_details_card.dart';
import 'package:car_help/features/home_client/presentation/widgets/category_details_appbar.dart';
import 'package:car_help/features/home_client/presentation/widgets/custom_search_widget.dart';
import 'package:car_help/features/widgets/failures_widget.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CategoryDetailsViewBody extends StatefulWidget {
  final ServiceEntity data;
  final String? lat, lng, address;

  const CategoryDetailsViewBody(
      {super.key, required this.data, this.lat, this.lng, this.address});

  @override
  State<CategoryDetailsViewBody> createState() =>
      _CategoryDetailsViewBodyState();
}

class _CategoryDetailsViewBodyState extends State<CategoryDetailsViewBody> {
  List<ProviderEntity> list = [];
  bool isSort = false;
  @override
  void initState() {
    BlocProvider.of<SearchCubit>(context)
        .search(categoryId: widget.data.id ?? 0, query: widget.data.name ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryDetailsAppBar(
            title: widget.data.name ?? '',
            location: widget.address ?? '',
          ),
          Expanded(
            child: Column(
              children: [
                CustomSearchWidget(
                  data: widget.data,
                  lat: widget.lat,
                  lng: widget.lng,
                  address: widget.address,
                  onTap: () {
                    isSort = !isSort;
                    if (isSort) {
                      list.sort((a, b) {
                        final aRate = a.averageRate ?? 0;
                        final bRate = b.averageRate ?? 0;
                        return aRate.compareTo(bRate);
                      });
                    } else {
                      list.sort((a, b) {
                        final aRate = a.averageRate ?? 0;
                        final bRate = b.averageRate ?? 0;
                        return bRate.compareTo(aRate);
                      });
                    }
                    setState(() {});
                  },
                ),
                BlocConsumer<SearchCubit, SearchState>(
                  listener: (BuildContext context, SearchState state) {
                    if (state is SearchSuccess) {
                      list.clear();
                      list.addAll(state.data);
                      list[0].averageRate = 1;
                      list[1].averageRate = 2;
                      list[2].averageRate = 3;
                    }
                  },
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return const LinearProgressIndicator();
                    }

                    if (list.isEmpty && state is SearchSuccess) {
                      return Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppAssets.emptyService),
                              const SizedBox(height: 20),
                              Text(
                                S.of(context).noServiceProviders,
                                style: AppStyles.textStyle16_800,
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (state is SearchFailure) {
                      return FailuresWidget(errorMessage: state.errorMessage);
                    }

                    return Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '${S.of(context).thereAre} ${list.length} ${S.of(context).serviceProvidersNearYou} ${widget.data.name}',
                              style: AppStyles.textStyle14_800Black,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return CategoriesDetailsCard(
                                    data: list[index],
                                    onTap: () {
                                      GoRouter.of(context).push(
                                          AppRouter.kProviderDetailsView,
                                          extra: list[index]);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

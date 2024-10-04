import 'package:car_help/config/function/service_locator.dart';
import 'package:car_help/features/addresses/presentation/manager/addresses%20cubit/addresses_cubit.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/domain/repos/home_client_repo.dart';
import 'package:car_help/features/home_client/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:car_help/features/home_client/presentation/widgets/category_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsView extends StatefulWidget {
  final ServiceEntity data;
  const CategoryDetailsView({super.key, required this.data});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  String? lat, lng, address;
  @override
  void initState() {
    BlocProvider.of<AddressesCubit>(context).getAddresses(remote: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<HomeClientRepo>()),
      child: BlocListener<AddressesCubit, AddressesState>(
        listener: (context, state) {
          if (state is AddressesSuccess) {
            for (var element in state.data) {
              if (element.isDefault == 1) {
                setState(() {
                  address = element.address;
                  lat = element.lat;
                  lng = element.lng;
                });

                break;
              }
            }
          }
        },
        child: CategoryDetailsViewBody(
          data: widget.data,
          lat: lat,
          lng: lng,
          address: address,
        ),
      ),
    );
  }
}

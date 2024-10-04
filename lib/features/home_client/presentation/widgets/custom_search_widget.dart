import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchWidget extends StatefulWidget {
  final ServiceEntity data;
  final String? lat, lng, address;
  final void Function()? onTap;
  const CustomSearchWidget(
      {super.key,
      required this.data,
      this.lat,
      this.lng,
      this.address,
      this.onTap});

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
    final cubit = BlocProvider.of<SearchCubit>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: widget.onTap,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text(S.of(context).rate),
                      Transform.rotate(
                        angle: 90 * 3.14 / 180,
                        child: const Icon(Icons.sync_alt),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
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
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onSubmitted: (value) {
                      cubit.search(
                          categoryId: widget.data.id ?? 0, query: value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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

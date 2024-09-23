import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_dropdown.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MultiSelectSheet extends StatefulWidget {
  const MultiSelectSheet({
    super.key,
    required this.categories,
    required this.onSelectedIds,
    required this.hintTitle,
    this.selectedIds = const [],
    required this.labalText,
  });

  final List<ServiceEntity> categories;
  final void Function(List<int>) onSelectedIds;
  final String hintTitle, labalText;
  final List<ServiceEntity> selectedIds;

  @override
  State<MultiSelectSheet> createState() => _MultiSelectSheetState();
}

class _MultiSelectSheetState extends State<MultiSelectSheet> {
  late List<int> _selectedIds;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selectedIds = widget.selectedIds.map((program) => program.id!).toList();
    _controller = TextEditingController(
      text: widget.selectedIds.map((category) => category.name!).join(', '),
    );
  }

  // Update the controller when new selections are made
  void _updateControllerText() {
    setState(() {
      _controller.text = _selectedIds.isEmpty
          ? ''
          : widget.categories
              .where((category) => _selectedIds.contains(category.id))
              .map((category) => category.name!)
              .join(', ');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextDropdown(
        readOnly: true,
        padding: EdgeInsets.only(
          top: SizeConfig.bodyHeight * .025,
          bottom: SizeConfig.bodyHeight * .025,
          right: SizeConfig.bodyHeight * .025,
        ),
        suffixIcon: AppAssets.arrowDown,
        validate: (value) =>
            value!.isEmpty ? S.of(context).feildRequiredValidation : null,
        onTap: () {
          showCupertinoModalBottomSheet(
            topRadius: const Radius.circular(30),
            context: context,
            builder: (context) => Container(
              height: SizeConfig.bodyHeight * .7,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: SizeConfig.screenWidth * .2,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: MultiSelectDialog(
                      categories: widget.categories,
                      selectedIds: _selectedIds,
                      onConfirm: (selected) {
                        setState(() {
                          _selectedIds = selected;
                          _updateControllerText();
                        });
                        widget.onSelectedIds(selected);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        controller: _controller,
        labelText: widget.labalText,
        hintText: widget.hintTitle,
      ),
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  const MultiSelectDialog({
    super.key,
    required this.categories,
    required this.selectedIds,
    required this.onConfirm,
  });

  final List<ServiceEntity> categories;
  final List<int> selectedIds;
  final void Function(List<int>) onConfirm;

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<int> _tempSelectedIds;

  @override
  void initState() {
    _tempSelectedIds = List.from(widget.selectedIds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Text(
            S.of(context).centerClassification,
            style: AppStyles.textStyle16_800,
          ),
          Text(
            S.of(context).multiSelectService,
            style: AppStyles.textStyle14_600Grey,
          ),
          Expanded(
            child: ListView(
              children: widget.categories.map((category) {
                return CheckboxListTile(
                  activeColor: AppColors.black,
                  value: _tempSelectedIds.contains(category.id),
                  title: Text(category.name ?? '',
                      style: AppStyles.textStyle16_800),
                  onChanged: (bool? isChecked) {
                    setState(() {
                      if (isChecked == true) {
                        _tempSelectedIds.add(category.id!);
                      } else {
                        _tempSelectedIds.remove(category.id);
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ),
          CustomButton(
            color: AppColors.black,
            titleColor: AppColors.white,
            onPressed: () {
              widget.onConfirm(_tempSelectedIds);
              Navigator.of(context).pop();
            },
            title: S.of(context).choose,
          ),
        ],
      ),
    );
  }
}

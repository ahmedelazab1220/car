import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/lists/domain/entities/dropdown_entity.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/features/widgets/custom_text_form_field%20copy.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SingleSelectSheet extends StatefulWidget {
  const SingleSelectSheet({
    super.key,
    required this.categories,
    required this.onSelectedId,
    required this.hintTitle,
    this.selectedId,
    required this.labaleText,
  });

  final List<DropDownEntity> categories;
  final void Function(int?) onSelectedId;
  final String hintTitle, labaleText;
  final DropDownEntity? selectedId;

  @override
  State<SingleSelectSheet> createState() => _SingleSelectSheetState();
}

class _SingleSelectSheetState extends State<SingleSelectSheet> {
  late int? _selectedId;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedId?.id!;

    // Initialize controller with the selected category
    _controller = TextEditingController(
      text: _selectedId == null
          ? ''
          : widget.categories
              .firstWhere((category) => category.id == _selectedId)
              .title!,
    );
  }

  // Update the controller when a new selection is made
  void _updateControllerText() {
    _controller.text = _selectedId == null
        ? ''
        : widget.categories
            .firstWhere((category) => category.id == _selectedId)
            .title!;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      readOnly: true,
      padding: EdgeInsets.only(
        top: SizeConfig.bodyHeight * .025,
        bottom: SizeConfig.bodyHeight * .025,
        right: SizeConfig.bodyHeight * .025,
      ),
      suffixIcon: AppAssets.arrowDown,
      onTap: () {
        showCupertinoModalBottomSheet(
          topRadius: const Radius.circular(30),
          context: context,
          builder: (context) => Container(
            height: SizeConfig.bodyHeight * .7,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
                  width: SizeConfig.screenWidth * .2,
                  height: 5,
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleSelectDialog(
                    categories: widget.categories,
                    selectedId: _selectedId,
                    onConfirm: (selected) {
                      setState(() {
                        _selectedId = selected;
                        _updateControllerText();
                      });
                      widget.onSelectedId(selected);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      controller: _controller,
      labelText: widget.labaleText,
      hintText: widget.hintTitle,
    );
  }
}

class SingleSelectDialog extends StatefulWidget {
  const SingleSelectDialog({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onConfirm,
  });

  final List<DropDownEntity> categories;
  final int? selectedId;
  final void Function(int?) onConfirm;

  @override
  _SingleSelectDialogState createState() => _SingleSelectDialogState();
}

class _SingleSelectDialogState extends State<SingleSelectDialog> {
  late int? _tempSelectedId;

  @override
  void initState() {
    _tempSelectedId = widget.selectedId;
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
          Expanded(
            child: ListView(
              children: widget.categories.map((category) {
                return CheckboxListTile(
                  activeColor: AppColors.black,
                  value: _tempSelectedId == category.id,
                  title: Text(category.title ?? '',
                      style: AppStyles.textStyle16_800),
                  onChanged: (bool? isSelected) {
                    setState(() {
                      // Ensure only one checkbox is selected at a time
                      if (isSelected == true) {
                        _tempSelectedId = category.id;
                      } else {
                        _tempSelectedId = null;
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
              widget.onConfirm(_tempSelectedId);
              Navigator.of(context).pop();
            },
            title: S.of(context).choose,
          ),
        ],
      ),
    );
  }
}

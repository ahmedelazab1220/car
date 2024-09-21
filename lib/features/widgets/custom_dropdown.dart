// import 'package:car_help/config/theme/app_theme.dart';
// import 'package:car_help/core/utils/app_colors.dart';
// import 'package:car_help/core/utils/app_size.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomDropDown extends StatefulWidget {
//   const CustomDropDown({
//     Key? key,
//     required this.categories,
//     required this.onSelected,
//     this.validate,
//     this.padding,
//     this.onChange,
//     this.onSuffixPressed,
//     this.suffixIcon,
//     this.labelText,
//     this.prefixText,
//     this.hintText,
//     this.prefixIcon,
//     this.prefixIconColor,
//     this.hintTextColor,
//     this.isEnable,
//   }) : super(key: key);
//   final List categories;
//   final void Function(String?) onSelected;
//   final FormFieldValidator<String>? validate;
//   final EdgeInsetsGeometry? padding;
//   final void Function(String?)? onChange;
//   final VoidCallback? onSuffixPressed;
//   final String? suffixIcon;
//   final String? labelText;
//   final String? prefixText;
//   final String? hintText;
//   final String? prefixIcon;
//   final Color? prefixIconColor;
//   final Color? hintTextColor;
//   final bool? isEnable;

//   @override
//   State<CustomDropDown> createState() => _CustomDropDownState();
// }

// class _CustomDropDownState extends State<CustomDropDown> {
//   String? selectedCategory;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return context.localizations.feildRequiredValidation;
//         }
//         return null;
//       },
//       // textAlign: widget.align,
//       // showCursor: true,
//       // readOnly: widget.readOnly,
//       // inputFormatters: widget.limits,
//       // controller: widget.controller,
//       // keyboardType: widget.type,
//       // obscureText: widget.isPassword,
//       style: mainTFFTextStyle(context, isEnabled: widget.isEnable ?? true),
//       // enabled: widget.isEnable,
//       // maxLines: widget.maxLines,
//       icon: widget.prefixIcon == null
//           ? null
//           : Padding(
//               padding: EdgeInsets.all(SizeConfig.bodyHeight * .02),
//               child: SvgPicture.asset(widget.prefixIcon!),
//             ),
//       // validator: widget.validate,
//       // onChanged: widget.onChange,
//       // onTap: widget.onTap,
//       decoration: InputDecoration(
//         labelText: widget.labelText,
//         prefixText: widget.prefixText,
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         floatingLabelStyle: labelTFFTextStyle(true),
//         prefixStyle: mainTFFTextStyle(context, color: AppColors.darkGrey),
//         labelStyle: labelTFFTextStyle(false),
//         hintText: widget.hintText,
//         errorStyle: const TextStyle(color: Colors.red),
//         focusedBorder: buildMainBuild(),
//         border: buildMainBuild(),
//         enabledBorder: buildMainBuild(),
//         disabledBorder: const UnderlineInputBorder(borderSide: BorderSide.none),
//         focusedErrorBorder: buildErrorBorder(),
//         errorBorder: buildErrorBorder(),
//         // prefixIcon: widget.prefixIcon == null
//         //     ? null
//         //     : Padding(
//         //         padding: EdgeInsets.all(SizeConfig.bodyHeight * .02),
//         //         child: SvgPicture.asset(widget.prefixIcon!),
//         //       ),
//         hintStyle: hintTFFTextStyle(color: widget.hintTextColor),
//         // suffixIcon: widget.suffixIcon == null
//         //     ? null
//         //     : InkWell(
//         //         onTap: widget.onSuffixPressed,
//         //         child: Padding(
//         //           padding: widget.padding ?? const EdgeInsets.all(12.0),
//         //           child: SvgPicture.asset(widget.suffixIcon!),
//         //         ),
//         //       ),
//       ),
//       value: selectedCategory,
//       onChanged: (String? newValue) {
//         setState(() {
//           selectedCategory = newValue;
//         });
//         widget.onSelected(selectedCategory);
//       },
//       items: widget.categories.map<DropdownMenuItem<String>>((dynamic value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }

import 'package:car_help/core/utils/app_assets.dart';
import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_size.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPDFWidget extends StatefulWidget {
  final void Function()? onTap;
  final String? title, subtitle;
  final String? urlString;

  const CustomPDFWidget({
    super.key,
    this.onTap,
    this.title,
    this.subtitle,
    this.urlString,
  });

  @override
  State<CustomPDFWidget> createState() => _CustomPDFWidgetState();
}

class _CustomPDFWidgetState extends State<CustomPDFWidget> {
  bool isDownload = false;
  Uri? uri;

  @override
  void initState() {
    super.initState();
    if (widget.urlString != null) {
      uri = Uri.parse(widget.urlString!);
    }
  }

  void _openPdf() async {
    if (uri != null) {
      try {
        await launchUrl(uri!);
        print('ojjjpoopkpoopkok');
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: uri != null ? () => _openPdf() : null,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.fileUpload),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.66,
                    child: Text(
                      widget.title ?? S.of(context).image,
                      style: AppStyles.textStyle14_700Black,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                      onTap: widget.onTap,
                      child: const Icon(
                        Icons.close,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

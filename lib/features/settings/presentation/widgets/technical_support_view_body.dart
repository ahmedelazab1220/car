import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/settings/domain/entites/contact_information_entity.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:flutter/material.dart';

class TechnicalSupportViewBody extends StatelessWidget {
  final ContactInformationEntity? data;
  const TechnicalSupportViewBody({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).contactUs,
          style: AppStyles.textStyle20_700,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              child: Text(
                data?.firstPhone ?? '234567890',
                style: AppStyles.textStyle16_800,
              ),
            ),
            const Spacer(),
            // GestureDetector(
            //     onTap: data?.whatsappPhone != null
            //         ? () async {
            //             // try {
            //             //   Uri phone = Uri.parse(
            //             //     'https://wa.me/${[data?.whatsappPhone ?? '']}',
            //             //   );
            //             //   await launchUrl(phone);
            //             // } catch (e) {
            //             //   debugPrint(e.toString());
            //             // }
            //           }
            //         : null,
            //     child: SvgPicture.asset(AppAssets.whatsappIcon)),
            const SizedBox(
              width: 16,
            ),
            // GestureDetector(
            //     onTap: data?.firstPhone != null
            //         ? () async {
            //             try {
            //               Uri phoneN = Uri(
            //                 scheme: 'tel',
            //                 path: data?.firstPhone,
            //               );
            //               await launchUrl(phoneN);
            //             } catch (e) {
            //               debugPrint(e.toString());
            //             }
            //           }
            //         : null,
            //     child: SvgPicture.asset(AppAssets.phoneIcon)),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(
                  30,
                ),
              ),
              child: Text(
                data?.firstEmail ?? 'example@gmail.com',
                style: AppStyles.textStyle16_800,
              ),
            ),
            const Spacer(),
            // GestureDetector(
            //   onTap: data?.firstEmail != null
            //       ? () async {
            //           try {
            //             Uri email = Uri(
            //               scheme: 'tel',
            //               path: data?.firstEmail,
            //             );
            //             await launchUrl(email);
            //           } catch (e) {
            //             debugPrint(
            //               e.toString(),
            //             );
            //           }
            //         }
            //       : null,
            //   child: SvgPicture.asset(AppAssets.emailIcon),
            // ),
          ],
        )
      ],
    );
  }
}

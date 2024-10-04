import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_strings.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/presentation/widgets/booking_price_card.dart';
import 'package:car_help/features/home_client/presentation/widgets/provider_times_controller.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_card.dart';
import 'package:car_help/features/orders/presentation/manager/add%20order%20cubit/add_order_cubit.dart';
import 'package:car_help/features/orders/presentation/manager/provider%20times%20cubit/provider_times_cubit.dart';
import 'package:car_help/features/widgets/custom_button.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:time_slot/controller/day_part_controller.dart';

class BookingViewBody extends StatefulWidget {
  final ProviderEntity data;
  final ExhibitsEntity dataExhibits;
  const BookingViewBody(
      {super.key, required this.data, required this.dataExhibits});

  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  DateTime _focusDate = DateTime.now();

  DateTime selectTime = DateTime.now();

  DayPartController dayPartController = DayPartController();
  String? orderFromTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceDetailsExhibitsCard(
              viewPrice: false,
              data: widget.dataExhibits,
            ),
            const BookingPriceCard(),
            const SizedBox(height: 20),
            Text(S.of(context).chooseDayAndTime,
                style: AppStyles.textStyle16_700),
            EasyInfiniteDateTimeLine(
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
              focusDate: _focusDate,
              onDateChange: (selectedDate) {
                setState(() {
                  _focusDate = selectedDate;
                });
                BlocProvider.of<ProviderTimesCubit>(context).getProviderTimes(
                    providerId: widget.data.id ?? 0,
                    orderDate:
                        DateFormat('yyyy-MM-dd', 'en').format(_focusDate));
              },
              activeColor: AppColors.primary.withOpacity(0.5),
              dayProps: EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: AppColors.grey.withOpacity(0.2),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ProviderTimesController(
                onTap: (time) {
                  orderFromTime = time;
                },
                providerId: widget.data.id ?? 0,
                orderDate: DateFormat('yyyy-MM-dd', 'en').format(
                  _focusDate,
                )),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                margin: const EdgeInsets.all(0),
                title: S.of(context).bookNaw,
                onPressed: () {
                  DateFormat dateFormat = DateFormat("HH:mm");
                  DateTime time = dateFormat.parse(orderFromTime ?? '');
                  DateTime orderToTime = time.add(const Duration(hours: 1));
                  String formattedOrderToTime = dateFormat.format(orderToTime);
                  BlocProvider.of<AddOrderCubit>(context).addOrder(
                      orderType: AppStrings.exhibited,
                      providerId: widget.data.id,
                      orderDate:
                          DateFormat('yyyy-MM-dd', 'en').format(_focusDate),
                      orderFromTime: orderFromTime,
                      orderToTime: formattedOrderToTime,
                      paymentMethod: 'cash');
                })
          ],
        ),
      ),
    );
  }
}

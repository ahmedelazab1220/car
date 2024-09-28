import 'package:car_help/core/utils/app_colors.dart';
import 'package:car_help/core/utils/app_styles.dart';
import 'package:car_help/features/home_client/presentation/widgets/booking_price_card.dart';
import 'package:car_help/features/home_client/presentation/widgets/service_details_exhibits_card.dart';
import 'package:car_help/generated/l10n.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:time_slot/controller/day_part_controller.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';
import 'package:time_slot/time_slot_from_list.dart';

class BookingViewBody extends StatefulWidget {
  const BookingViewBody({super.key});

  @override
  State<BookingViewBody> createState() => _BookingViewBodyState();
}

class _BookingViewBodyState extends State<BookingViewBody> {
  DateTime _focusDate = DateTime.now();

  DateTime selectTime = DateTime.now();

  DayPartController dayPartController = DayPartController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ServiceDetailsExhibitsCard(
              viewPrice: false,
            ),
            const BookingPriceCard(),
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
              },
              activeColor: AppColors.primary.withOpacity(0.5),
              dayProps: EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBackground,
                todayHighlightColor: AppColors.grey.withOpacity(0.2),
              ),
            ),
            const Divider(),
            const Text(
                "times slot from interval (10:00 AM to 10:00 PM) every hour"),
            const Divider(),
            const Text("-------------- EN --------------"),
            TimesSlotGridViewFromInterval(
              locale: "en",
              initTime: selectTime,
              crossAxisCount: 4,
              timeSlotInterval: const TimeSlotInterval(
                start: TimeOfDay(hour: 10, minute: 00),
                end: TimeOfDay(hour: 22, minute: 0),
                interval: Duration(hours: 1, minutes: 0),
              ),
              onChange: (value) {
                setState(() {
                  selectTime = value;
                });
              },
            ),
            const Text("-------------- AR --------------"),
            TimesSlotGridViewFromInterval(
              locale: "ar",
              initTime: selectTime,
              crossAxisCount: 4,
              timeSlotInterval: const TimeSlotInterval(
                start: TimeOfDay(hour: 10, minute: 00),
                end: TimeOfDay(hour: 22, minute: 0),
                interval: Duration(hours: 1, minutes: 0),
              ),
              onChange: (value) {
                setState(() {
                  selectTime = value;
                });
              },
            ),
            const Divider(),
            const Text("times slot from list"),
            const Divider(),
            const Text("-------------- EN --------------"),
            TimesSlotGridViewFromList(
              locale: "en",
              initTime: selectTime,
              crossAxisCount: 4,
              listDates: [
                DateTime(2023, 1, 1, 10, 30),
                DateTime(2023, 1, 1, 11, 30),
                DateTime(2023, 1, 1, 12, 30),
                DateTime(2023, 1, 1, 13, 30),
                DateTime(2023, 1, 1, 14, 30),
                DateTime(2023, 1, 1, 15, 30)
              ],
              onChange: (value) {
                setState(() {
                  selectTime = value;
                });
              },
            ),
            const Text("-------------- AR --------------"),
            TimesSlotGridViewFromList(
              initTime: selectTime,
              crossAxisCount: 4,
              unSelectedColor: AppColors.hint.withOpacity(0.2),
              listDates: [
                DateTime(2023, 1, 1, 10, 30),
                DateTime(2023, 1, 1, 11, 30),
                DateTime(2023, 1, 1, 12, 30),
                DateTime(2023, 1, 1, 13, 30),
                DateTime(2023, 1, 1, 14, 30),
                DateTime(2023, 1, 1, 15, 30)
              ],
              onChange: (value) {
                setState(() {
                  selectTime = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

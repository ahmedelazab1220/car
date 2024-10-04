import 'package:car_help/features/home_client/presentation/widgets/booking_view_controller.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  final List list;
  const BookingView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BookingViewController(
        data: list[0],
        dataExhibits: list[1],
      ),
    );
  }
}

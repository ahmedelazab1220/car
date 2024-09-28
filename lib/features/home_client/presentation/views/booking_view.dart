import 'package:car_help/features/home_client/presentation/widgets/booking_view_body.dart';
import 'package:flutter/material.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BookingViewBody(),
    );
  }
}

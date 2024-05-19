import 'package:flutter/material.dart';
import 'package:gbsub/Features/bmi/presenatation/views/widgets/CustomAppbar.dart';
import 'package:gbsub/Features/speciality_booking_doctor/Ui/speciality_view_boy.dart';

class SpecialityViewPicking extends StatelessWidget {
  const SpecialityViewPicking({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppbar(title: 'التخصصات'),
        body: SPecialityViewBody(),
      ),
    );
  }
}

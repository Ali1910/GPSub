import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Features/booking_history/logic/boking_history_cubit.dart';
import 'package:gbsub/Features/booking_history/logic/booking_history_states.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/success_empty_body.dart';
import 'package:gbsub/Features/booking_history/ui/widgets/success_has_data_body.dart';
import 'package:gbsub/Features/doctor_booking/logic/booking_cubit.dart';
import 'package:gbsub/core/utilts/style.dart';

class ListOfCancelledPersonalRecord extends StatelessWidget {
  const ListOfCancelledPersonalRecord({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingHistroyCubit, BookingHistoryStates>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => BookingCubit(),
          child: FutureBuilder(
            future: BookingHistroyCubit(dio: Dio())
                .getAppointMents(Sharedhelper.getintdata(intkey), true),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: mainColor,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data.isEmpty
                    ? const ScuccesEmptyBody(
                        text: 'لا توجد حجوزات ملغية',
                      )
                    : SucessBody(
                        appointmentDateModelDTO: snapshot.data,
                      );
              } else {
                return Center(
                  child: Text(
                    'لا توجد مواعيد ',
                    style: Styles.styleBold24.copyWith(color: mainColor),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
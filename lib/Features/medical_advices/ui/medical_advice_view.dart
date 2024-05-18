import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/utilts/constans.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Features/medical_advices/logic/health_advice_cubit.dart';
import 'package:gbsub/Features/medical_advices/ui/medical_advice_view_body.dart';

class MedicalAdviceView extends StatelessWidget {
  const MedicalAdviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthAdviceCubit(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: mainColor),
            title: Text(
              'الأرشادات',
              style: Styles.styleBold24.copyWith(color: mainColor),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: const MedicalViewBody(),
          ),
        ),
      ),
    );
  }
}
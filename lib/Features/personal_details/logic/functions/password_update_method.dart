import 'package:flutter/material.dart';
import 'package:gbsub/Core/utilts/widgets/custom_snack_bar.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/personal_details/logic/personal_details_cubit.dart';

Future<void> passwordUpdateMethod(
    PersonalDetailsCubit of, BuildContext context) async {
  if (of.formkey.currentState!.validate()) {
    await of.updatePassword();
    if (of.result == 'تم تعديل كلمة المرور بنجاح') {
      customSnackBar(context, of.result);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const HomeView();
      }), (Route<dynamic> route) => false);
    } else {
      customSnackBar(context, of.result, duration: 2000);
    }
  } else {
    of.autovalidateMode = AutovalidateMode.always;
  }
}

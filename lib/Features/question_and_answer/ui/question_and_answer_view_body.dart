import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gbsub/Core/cubits/main_cubit.dart';
import 'package:gbsub/Core/cubits/main_states.dart';
import 'package:gbsub/Core/utilts/style.dart';
import 'package:gbsub/Core/utilts/widgets/failed_body.dart';
import 'package:gbsub/Core/utilts/widgets/loading_body.dart';
import 'package:gbsub/Features/question_and_answer/ui/widgets/custom_custom_question_item_list_view.dart';
import 'package:gbsub/Features/question_and_answer/ui/widgets/custom_tab_bar.dart';
import 'package:gbsub/Features/question_and_answer/ui/widgets/question_upper_body.dart';

class QuestionAndAnswerViewBody extends StatelessWidget {
  const QuestionAndAnswerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var of = BlocProvider.of<MainCubit>(context);
    return FutureBuilder(
      future: of.getAllQuetions(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<MainCubit, MainStates>(
              builder: (context, state) {
                return Column(
                  children: [
                    const QuestionUpperBody(),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomQuestionTabBar(),
                    SizedBox(
                      height: 10.h,
                    ),
                    state is FetchingQuestionLoading
                        ? const LoadingBody()
                        : state is FetchingQuestionSucsess &&
                                of.questions.isNotEmpty
                            ? CustomListViewQuestionElement(of: of)
                            : state is! FetchingQuestionFailing
                                ? Center(
                                    child: Column(
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.boxOpen,
                                          color: Colors.grey,
                                          size: 40.w,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text(
                                          'لا يوجد أي أسئلة في الوقت الحالي ',
                                          style: Styles.style16
                                              .copyWith(color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  )
                                : const FailedBody(
                                    text: '"تأكد من الأتصال بالأنترنت"',
                                  )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

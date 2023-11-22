import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/features/notifications/presentation/view_models/notifications_states.dart';
import 'package:resithon_event/features/sessions/presentations/view_models/get_session_evaluation_cubit/get_session_evaluation_cubit.dart';
import 'package:resithon_event/features/sessions/presentations/views/widgets/session_qustion_item.dart';

import '../../../../../../core/shared_widgets/error_widget.dart';
import '../../../../../../core/utils/constants.dart';

class SessionQuestionList extends StatelessWidget {
  const SessionQuestionList({super.key, required this.sessionId});

  final int sessionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSessionEvaluationCubit, GetSessionEvaluationState>(
      builder: (BuildContext context, state) {
        if (state is UserGetSessionEvaluationSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return SessionQuestionItem(
                index: index,
                question: state.model.data![index].name!,
                id: state.model.data![index].id!,
                sessionId: sessionId,
              );
            },
            itemCount: state.model.data!.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: AppConstants.height20(context),
              );
            },
          );
        } else if (state is UserGetSessionEvaluationErrorState) {
          return CustomErrorWidget(
            onTap: () {
              context
                  .read<GetSessionEvaluationCubit>()
                  .getSessionEvaluationDetails();
            },
          );
        } else if (state is GetAllNotificationsDataLoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .24,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

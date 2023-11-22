import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/features/user/projects/presentation/view_models/project_evaluation_cubit/project_evaluation_cubit.dart';
import 'package:resithon_event/features/user/projects/presentation/views/widgets/qustion_item.dart';

import '../../../../../../core/shared_widgets/error_widget.dart';
import '../../../../../../core/utils/constants.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key, required this.projectId});
final int projectId;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ProjectEvaluationCubit, ProjectEvaluationState>(
      builder: (BuildContext context, state) {
        if (state is UserProjectEvaluationSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context,int index){
              return  QuestionItem(index: index, question: state.model.data![index].name!,id: state.model.data![index].id!, projectId: projectId,);
            },itemCount: state.model.data!.length, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: AppConstants.height20(context),);
          },);
        } else if (state is UserProjectEvaluationErrorState) {
          return CustomErrorWidget(
            onTap: () {
              context.read<ProjectEvaluationCubit>().projectEvaluationDetails();
            },
          );
        } else if (state is UserProjectEvaluationLoadingState) {
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

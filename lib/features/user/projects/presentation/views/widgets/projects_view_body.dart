import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resithon_event/core/shared_widgets/custom_back_button.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/constants.dart';
import 'package:resithon_event/features/user/projects/presentation/views/widgets/projects_list.dart';

import '../../../../../../core/shared_widgets/error_widget.dart';
import '../../view_models/projects_cubit/all_projects_cubit.dart';

class ProjectsViewBody extends StatelessWidget {
  const ProjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.sp20(context)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: AppConstants.height20(context),
                  ),
                  const CustomBackButton(),
                  SizedBox(
                    height: AppConstants.height20(context),
                  ),
                  MainTitleComponent(title: "finalProject".tr()),
                  SizedBox(
                    height: AppConstants.height20(context),
                  ),
                  BlocBuilder<AllProjectsCubit, AllProjectsState>(
                      builder: (BuildContext context, state) {
                    if (state is UserAllProjectsSuccessState) {
                      return ProjectsList(
                        instance: state.model,
                      );
                    } else if (state is UserAllProjectsErrorState) {
                      return CustomErrorWidget(
                          height: MediaQuery.of(context).size.height * .24,
                          imgWidth: MediaQuery.of(context).size.width * .2);
                    } else if (state is UserAllProjectsLoadingState) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

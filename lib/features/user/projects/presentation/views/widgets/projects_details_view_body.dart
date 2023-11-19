import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:resithon_event/core/shared_widgets/custom_button.dart';
import 'package:resithon_event/core/shared_widgets/main_title_component.dart';
import 'package:resithon_event/core/utils/colors/colors.dart';
import 'package:resithon_event/core/utils/services/local_services/cache_helper.dart';
import 'package:resithon_event/features/user/projects/presentation/views/evaluation_view.dart';
import 'package:resithon_event/features/user/projects/presentation/views/widgets/team_list.dart';

import '../../../../../../core/shared_widgets/custom_back_button.dart';
import '../../../../../../core/shared_widgets/more_details_widget.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../data/models/project_model.dart';

class ProjectsDetailsViewBody extends StatelessWidget {
  const ProjectsDetailsViewBody({super.key, required this.instance});

  final ProjectData instance;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final aDate = DateTime(
        int.parse(CacheHelper.getData(key: "event_end_day").toString().split("-")[0]),
        int.parse(CacheHelper.getData(key: "event_end_day").toString().split("-")[1]),
        int.parse(CacheHelper.getData(key: "event_end_day").toString().split("-")[2]));

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: instance.image!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.greyColor,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Padding(
                        padding: EdgeInsets.all(AppConstants.sp20(context)),
                        child: const CustomBackButton(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context)),
                  child: Column(
                    children: [
                      MainTitleComponent(title: instance.name!),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.width20(context)),
                  child: MoreDetailsWidget(
                    title: 'description'.tr(),
                    description: instance.description!,
                  ),
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
                TeamList(
                  instance: instance.team!,
                ),
                SizedBox(
                  height: AppConstants.height20(context),
                ),
              ],
            ),
          ),
        ),
        if (CacheHelper.getData(key: "can_rate")==true)
          instance.has_rate!
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.sp20(context)),
                    child: Text(
                      "Project Rated Successfully",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height * .018,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ))
              : DefaultButton(
                  onPress: () {
                    if (aDate == today) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EvaluationView(projectId: instance.id!)));
                    }
                  },
                  text: aDate == today
                      ? "Rate"
                      : "Rate Availble Only in The End Day",
                  backgroundColor: aDate == today
                      ? AppColors.secondaryColor
                      : AppColors.greyColor,
                )
      ],
    );
  }
}

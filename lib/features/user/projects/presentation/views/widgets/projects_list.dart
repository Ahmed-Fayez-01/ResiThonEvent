import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resithon_event/features/user/projects/presentation/views/projects_details_view.dart';
import 'package:resithon_event/features/user/projects/presentation/views/widgets/project_item.dart';

import '../../../../../../core/utils/assets/assets.dart';
import '../../../../../../core/utils/colors/colors.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../data/models/project_model.dart';

class ProjectsList extends StatefulWidget {
  const ProjectsList({super.key, required this.instance});

  final ProjectModel instance;

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  @override
  void initState() {
    AppConstants.foundedProjects = widget.instance.data!;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<ProjectData> result = [];
    if (enteredKeyword.isEmpty) {
      result = widget.instance.data!;
    } else {
      result = widget.instance.data!
          .where((session) => session.name!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      AppConstants.foundedProjects = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          onChanged: (value) {
            runFilter(value);
          },
          decoration: InputDecoration(
              suffixIcon: const Icon(
                CupertinoIcons.search,
                size: 30,
                color: AppColors.primarySwatchColor,
              ),
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(AppConstants.sp10(context)),
                  borderSide: const BorderSide(color: Color(0xffC8C8C8))),
              hintText: 'search'.tr(),
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: MediaQuery.of(context).size.height * .018,
                  color: const Color(0xffC8C8C8))),
        ),
        SizedBox(
          height: AppConstants.height10(context),
        ),
        AppConstants.foundedProjects.isNotEmpty
            ? SizedBox(
          height: MediaQuery.of(context).size.height * .7,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        AppConstants.evaluationSubmit.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProjectsDetailsView(
                                      instance:
                                          AppConstants.foundedProjects[index],
                                    )));
                      },
                      child: ProjectItem(
                        title: AppConstants.foundedProjects[index].name!,
                        imgPath: AppConstants.foundedProjects[index].image!,
                      ),
                    );
                  },
                  itemCount: AppConstants.foundedProjects.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: AppConstants.height10(context),
                    );
                  },
                ),
            )
            : SizedBox(
                height: MediaQuery.of(context).size.height * .6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetData.noSessions,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * .5,
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

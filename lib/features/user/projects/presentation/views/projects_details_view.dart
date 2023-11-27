import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resithon_event/features/user/projects/presentation/views/projects_view.dart';
import 'package:resithon_event/features/user/projects/presentation/views/widgets/projects_details_view_body.dart';

import '../../../../../core/utils/colors/colors.dart';
import '../../data/models/project_model.dart';

class ProjectsDetailsView extends StatelessWidget {
  const ProjectsDetailsView({super.key,required this.instance});
final ProjectData instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:  const SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              systemNavigationBarColor: AppColors.secondaryColor,
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          )
      ),
      body: ProjectsDetailsViewBody(instance: instance,),
    );
  }
}
